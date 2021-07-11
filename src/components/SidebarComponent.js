import "./SidebarComponent.css"
import {AreaChartOutlined, PieChartOutlined, BarChartOutlined, RiseOutlined} from '@ant-design/icons';
import logo from '../assets/logo.png';

const SidebarComponent =()=>{
  return(
    <div className="sideBar">
        <div>
          
          <div>
            <img src={logo} className="logo"></img>
          </div>
          <div className="sideBarItem">
            <AreaChartOutlined style={{ color: "orange" }}/>
            <div className="sideBarItemText">
              Dashboard
            </div>
           
          </div>
          <div className="sideBarItem">
            <PieChartOutlined style={{ color: "red" }}/>
            <div className="sideBarItemText">
              Icons
            </div>
           
          </div>
          <div className="sideBarItem">
            <BarChartOutlined style={{ color: "blue" }}/>
            <div className="sideBarItemText">
              Google
            </div>
           
          </div>
          <div className="sideBarItem">
            <AreaChartOutlined style={{ color: "green" }} />
            <div className="sideBarItemText">
              Profile
            </div>
           
          </div>
          <div className="sideBarItem">
            <AreaChartOutlined style={{ color: "purple" }}/>
            <div className="sideBarItemText">
              Tables
            </div>
           
          </div>
          <div className="sideBarItem">
            <RiseOutlined style={{ color: "deepskyblue" }}/>
            <div className="sideBarItemText">
              Login
            </div>
           
          </div>
          <div className="sideBarItem">
            <AreaChartOutlined style={{ color: "orange" }}/>
            <div className="sideBarItemText">
              Register
            </div>
          </div>
          </div>

          <div className="documentationItem">
            Documentation
          </div>

          <div className="sideBarItem">
            <AreaChartOutlined />
            <div className="sideBarItemText">
              Getting started
            </div>
          </div>

          <div className="sideBarItem">
            <AreaChartOutlined />
            <div className="sideBarItemText">
              Foundation
            </div>
          </div>

          <div className="sideBarItem">
            <AreaChartOutlined />
            <div className="sideBarItemText">
              Components
            </div>
          </div>

          <div className="sideBarItem">
            <AreaChartOutlined />
            <div className="sideBarItemText">
              Plugins
            </div>
          </div>


    </div>
      
          
    
    )
}

export default SidebarComponent

