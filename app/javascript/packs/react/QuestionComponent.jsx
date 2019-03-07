import React from 'react'
import PropTypes from 'prop-types'
import ReactDOM from 'react-dom'
import axios from 'axios'
const baseUrl = "http://localhost:3000";

export default class QuestionComponent extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      data: [],
      next: 0,
      answer: '',
      error: ''
    }
    this.nextQuestion = this.nextQuestion.bind(this);
    // this.handleChange = this.handleChange.bind(this);
  }


  handleChange(e) {
    const optionValue = e.target.value;
    this.setState({
      answer: optionValue,
      error: optionValue ? '' : 'please select any option.'
    });
  }

  nextQuestion(id) {
    const nextVal = this.state.next;
    const answer = this.state.answer;
    if (this.state.answer) {
      axios.post(baseUrl+'/user_activity/save_user_answers', {
        "user_answer": {
          question_id: id,
          answer: answer
        }
      })
      .then(function (response) {
        if (response.data == "answer save successfully.") {
          this.setState({
            error: ''
          });
          if(nextVal < 4) {
            this.setState({
              answer: '',
              next: this.state.next+1
            });
          }else{
            window.location.replace(`${baseUrl}/finish`);
          }
        }
      }.bind(this))
      .catch(function (error) {
        console.log(error);
      });
    }else{
      this.setState({
        error: 'please select any option.'
      });
    }
  }

  render() {
    return (
      <div>
        { this.props.question.length && this.props.question.map(function(question,index) {
          if(index == this.state.next) {
            return (
              <form key={index}>
                <div className="container que">
                  {this.state.error ? <div className="alert alert-danger" role="alert">
                        <strong>{this.state.error}</strong>
                      </div> : '' }
                  <div className="form-group card shadow p-4 mt-5">
                    <label >{question.title}</label><br/>
                    { question.options.map((op,index) =>
                      <div key={index} className="form-check d-inline-block pr-2">
                        <input className="form-check-input radio-btn" type="radio" name="answer" value={op} onChange={(e) => this.handleChange(e)} />
                        <label className="form-check-label" >
                          {op}
                        </label>
                      </div>
                    )}
                  </div>
                  <button type="button" className="btn btn-success" onClick={(id) => {this.nextQuestion(question.id)}}>Next</button>
                </div>
              </form>
            )
          }
        }, this)}
      </div>
    )
  }

  static injectToPage(selector, props) {
    $(() => {
      let div = $('<div>')
      let x = $(selector)
      if (x.length > 0) {
        x.replaceWith(div)
        ReactDOM.render(
          <QuestionComponent question={props.question} user={props.user} />,
          div[0],
        )
      }
    })
  }
}
