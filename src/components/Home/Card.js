import "./Card.css"
import {ArrowUpOutlined} from '@ant-design/icons';
import 'antd/dist/antd.css';

const Card =(props)=>{
	return(
		<div className="cardComponent">
			<div className="infoWrapper">
			<div>
				<div className="cardName">
					{props.cardName}	
				</div>

				<div className="cardNumber">
					{props.cardNumber}	
				</div>
			</div>

				<div className="circle" style={{background: `linear-gradient(to right, ${props.color[0]}, ${props.color[1]})`}}>
					<img src={props.circleItem} className="circleItem"/>
				</div>
			</div>

			<div className="cardWrapper">
				<div className="cardPercent">
					<ArrowUpOutlined />
					3,48
				</div>

				<div cardName="cardDate">
					Since last month
				</div>
			</div>

			
		</div>
	)
}

export default Card