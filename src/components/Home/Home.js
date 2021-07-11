import "./Home.css"
import 'antd/dist/antd.css';
import { Input, Space } from 'antd';
import { Avatar } from 'antd';
import {BellOutlined, BlockOutlined, UserOutlined, HomeOutlined} from '@ant-design/icons';
import { Button } from 'antd';
import chart from "../../assets/chart.png";
import email from "../../assets/email.png"
import cloud from "../../assets/cloud.png"
import web from "../../assets/web.png"

import Card from "./Card.js"

const { Search } = Input;

const Home =()=>{
	return(
		<div className="homeComponent">
			<div className="homeHeader">
				<div className="homeHeaderInfo">

					<div className="searchBar">
						<Search placeholder="input search text" style={{ width: 300 }}/>

					</div>

					<div className="userInfo">
						<BellOutlined  style={{ fontSize: '150%', color: "white"}}/>
						<BlockOutlined style={{ fontSize: '150%', color: "white"}}/>
						<Avatar size={54} icon={<UserOutlined />} />
						<div className="userName">
							Valerii Jmyshenko
						</div>
					</div>
				</div>
				<div className="pathInfo">
					<div className="pathWrapper">
						<div className="pathName">
							Derfault
						</div>
						<div className="pathBox">
							<HomeOutlined />
							<div className="pathBoxInfo">
								/ Dashboard / Default
							</div>
						</div>
					</div>

					<div className="pathWrapper">
						<Button>New</Button>
						<Button>Filters</Button>
					</div>


				</div>
				<div className="cards">
					<Card cardName="Total Traffic" cardNumber="350,897" circleItem={chart} color={["#74ebd5", "#ACB6E5"]}></Card>
					<Card cardName="New Users" cardNumber="2,356"  circleItem={cloud} color={["#e1eec3", "#f05053"]}></Card>
					<Card cardName="Sales" cardNumber="924" circleItem={web} color={["#22c1c3", "#fdbb2d"]}></Card>
					<Card cardName="Performance" cardNumber="49,65%" circleItem={email} color={["#ff9966", "#ff5e62"]}></Card>
				</div>
			</div>

		</div>
	)
}

export default Home