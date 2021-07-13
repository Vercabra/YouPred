import "./HomeBody.css"

import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, BarChart, Bar, } from 'recharts';
import { Table, Tag, Space } from 'antd';

import LoadingPage from "../LoadingPage.js"
import 'antd/dist/antd.css';

const columns = [
  {
    title: 'Name',
    dataIndex: 'name',
    key: 'name',
    render: text => <a>{text}</a>,
  },
  {
    title: 'Age',
    dataIndex: 'age',
    key: 'age',
  },
  {
    title: 'Address',
    dataIndex: 'address',
    key: 'address',
  },
  {
    title: 'Tags',
    key: 'tags',
    dataIndex: 'tags',
    render: tags => (
      <>
        {tags.map(tag => {
          let color = tag.length > 5 ? 'geekblue' : 'green';
          if (tag === 'loser') {
            color = 'volcano';
          }
          return (
            <Tag color={color} key={tag}>
              {tag.toUpperCase()}
            </Tag>
          );
        })}
      </>
    ),
  },
  {
    title: 'Action',
    key: 'action',
    render: (text, record) => (
      <Space size="middle">
        <a>Invite {record.name}</a>
        <a>Delete</a>
      </Space>
    ),
  },
];

const data = [
  {
    key: '1',
    name: 'John Brown',
    age: 32,
    address: 'New York No. 1 Lake Park',
    tags: ['nice', 'developer'],
  },
  {
    key: '2',
    name: 'Jim Green',
    age: 42,
    address: 'London No. 1 Lake Park',
    tags: ['loser'],
  },
  {
    key: '3',
    name: 'Joe Black',
    age: 32,
    address: 'Sidney No. 1 Lake Park',
    tags: ['cool', 'loh'],
  },
    {
    key: '4',
    name: 'Joe Black',
    age: 54,
    address: 'Sidney No. 1 Lake Park',
    tags: ['cool', 'teacher'],
  },
    {
    key: '5',
    name: 'Joe Black',
    age: 69,
    address: 'Sidney No. 1 Lake Park',
    tags: ['cool', 'teacher'],
  },
];

const data2 = [
  {
    key: '1',
    name: 'John Brown',
    age: 32,
    
    tags: ['nice', 'developer'],
  },
  {
    key: '2',
    name: 'Jim Green',
    age: 42,
    
    tags: ['loser'],
  },
  {
    key: '3',
    name: 'Joe Black',
    age: 32,
    
    tags: ['cool', 'loh'],
  },
    {
    key: '4',
    name: 'Joe Black',
    age: 54,
    
    tags: ['cool', 'teacher'],
  },
    {
    key: '5',
    name: 'Joe Black',
    age: 69,
   
    tags: ['cool', 'teacher'],
  },
];


const HomeBody =(props)=>{
	if(!props.data){
  		return <LoadingPage />
  	}
	return(
		<div className="HomeBody">

			<div className="lineWrapper">
				<div className="chartBox">
					<div className="chartName">
					Overwiew
					</div>
					<div className="chartWrapper">
					  <LineChart width={900} height={400} margin={{top: 20, left: 20}} data={props.data.slice(1, 25)}>
					    <XAxis dataKey="data" stroke="silver"/>
					    <YAxis stroke="silver"/>
					    <Line type="monotone" strokeWidth={3} dataKey="views" stroke="#8884d8" />
					    <Tooltip />
					  </LineChart>
				  	</div>
				</div>

				<div className="barBox">
					<div className="chartName black">
						Total Orders
					</div>
					<BarChart width={590} height={400} margin={{top: 20, left: 20, right: 40}} data={props.data.slice(25, 50)}>
						<XAxis dataKey="data" stroke="silver"/>
						<YAxis stroke="silver"/>
						<Bar strokeWidth={1} dataKey="views" fill="#fb6340" />
						<Tooltip />
					</BarChart>
				</div>
			</div>

			<div className="lineWrapper">
				<div className="infoTable">
					<Table columns={columns} dataSource={data} />
				</div>

				<div className="infoTable second">
					<Table columns={columns} dataSource={data2} />
				</div>
			</div>


		</div>
	)
}

export default HomeBody