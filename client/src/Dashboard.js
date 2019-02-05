import React from 'react'
import { Container, Header, Dimmer, Loader, Divider } from 'semantic-ui-react'
import ReactChartkick, { LineChart, BarChart, PieChart, AreaChart } from 'react-chartkick'
import Chart from 'chart.js'

ReactChartkick.addAdapter(Chart)

class Dashboard extends React.Component {
  constructor (state) {
    super(state);
    this.state    = []
    this.getStats = this.getStats.bind(this)
  }

  componentDidMount () {
    this.getStats()
  }

  fetch (endpoint) {
    return window.fetch(endpoint)
      .then(response => response.json())
      .catch(error => console.log(error))
  }

  getStats () {
    this.fetch("/api/crime_stats")
      .then(stats => {
        if (stats.length) {
          this.setState({stats: stats})
        } else {
          this.setState({stats: []})
        }
      })
  }

  render () {
    let stats = this.state.stats
    return stats
      ?   <Container text>
          <br/>
            <Divider color='teal'>
              <Header as='h2' icon textAlign='center' color='teal'>Crime by Province</Header>
              <PieChart  download="by_province" data={stats[1]} />
              <Header as='h2' icon textAlign='center' color='teal'>Crime by Year</Header>
              <BarChart  download="by_year" data={stats[3]} />
              <Header as='h2' icon textAlign='center' color='teal'>Crime by Police station</Header>
              <LineChart download="by_police_station"  data={stats[2]} />
              <Header as='h2' icon textAlign='center' color='teal'>Crime by name</Header>
              <AreaChart download="by_crime_name" data={stats[0]} />
            </Divider>
          </Container>
      : <Container text>
        <Dimmer active inverted>
          <Loader content='Loading' />
        </Dimmer>
      </Container>
  }
}

export default Dashboard
