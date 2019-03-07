import React from 'react'
import HelloComponent from './HelloComponent'
import QuestionComponent from './QuestionComponent'

export default function init() {
  window.HelloComponent = HelloComponent;
  window.QuestionComponent = QuestionComponent;
}
