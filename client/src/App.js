import React, { Component } from 'react'
import { Container, Header, Icon} from 'semantic-ui-react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Dashboard from './Dashboard'
import NotFound from './NotFound'

class App extends Component {

  render () {
    return(
      <Container text>
          <Header as='h2' icon textAlign='center' color='teal'>
            <Icon name='chart area' circular />
            <Header.Content>
              Crime Statistics in South Africa
            </Header.Content>
            <p>2005 - 2017</p>
          </Header>
          <br/><br/>
          <Router>
            <Switch>
              <Route path='/' exact component={Dashboard} />
              <Route component={NotFound} />
            </Switch>
          </Router>
      </Container>
    )
  }
}

export default App
