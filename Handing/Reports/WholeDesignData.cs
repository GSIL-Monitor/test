using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Handing.Reports
{
    /*Author: FLY  Date:2017.6.26 Email:zefllj@126.com*/

    public class WholeDesignData
    {
        #region 小车模块

        #region 起升电机减速器
        //1.定义起重量，未用
        private static double _whload;
        public double whload
        {
            get { return _whload; }
            set { _whload = value; }
        }
        //2.定义工作级别
        private static string _whclass;
        public string whclass
        {
            get { return _whclass; }
            set { _whclass = value; }
        }
        //3.定义起升速度
        private static string _whliftspeed;
        public string whliftspeed
        {
            get { return _whliftspeed; }
            set { _whliftspeed = value; }
        }
        //4.定义起升电机功率
        private static string _whliftpower;
        public string whliftpower
        {
            get { return _whliftpower; }
            set { _whliftpower = value; }
        }
        //5.定义起升减速器减速比
        private static string _whliftratio;
        public string whliftratio
        {
            get { return _whliftratio; }
            set { _whliftratio = value; }
        }
        //6.定义起升减速器扭矩
        private static string _whlifttorque;
        public string whlifttorque
        {
            get { return _whlifttorque; }
            set { _whlifttorque = value; }
        }
        //7.定义起升卷筒直径
        private static string _whliftdrumdia;
        public string whliftdrumdia
        {
            get { return _whliftdrumdia; }
            set { _whliftdrumdia = value; }
        }
        //8.定义起升卷筒直径
        private static string _whliftoverride;
        public string whliftoverride
        {
            get { return _whliftoverride; }
            set { _whliftoverride = value; }
        }
        //9.定义起升电机减速器型号
        private static string _whlifttype;
        public string whlifttype
        {
            get { return _whlifttype; }
            set { _whlifttype = value; }
        }
        //10.定义电机控制方式
        private static string _whcontype;
        public string whcontype
        {
            get { return _whcontype; }
            set { _whcontype = value; }
        }
        #endregion

        #region 吊钩组
        //10.定义吊钩强度等级
        private static string _whhookclass;
        public string whhookclass
        {
            get { return _whhookclass; }
            set { _whhookclass = value; }
        }
        //11.定义吊钩钩号
        private static string _whhooknum;
        public string whhooknum
        {
            get { return _whhooknum; }
            set { _whhooknum = value; }
        }
        //12.定义吊钩材料
        private static string _whhookmat;
        public string whhookmat
        {
            get { return _whhookmat; }
            set { _whhookmat = value; }
        }
        #endregion

        #region 钢丝绳
        //13.滑轮组效率，未用
        private static string _rope_pulley_block_efficiency;

        public  string Rope_pulley_block_efficiency
        {
            get { return WholeDesignData._rope_pulley_block_efficiency; }
            set { WholeDesignData._rope_pulley_block_efficiency = value; }
        }
        //14.钢丝绳安全系数，未用
        private static string _rope_pulley_block_safety_margin;

        public  string Rope_pulley_block_safety_margin
        {
            get { return WholeDesignData._rope_pulley_block_safety_margin; }
            set { WholeDesignData._rope_pulley_block_safety_margin = value; }
        }
        //15.钢丝绳型号
        private static string _rope_pulley_block_version;

        public  string Rope_pulley_block_version
        {
            get { return WholeDesignData._rope_pulley_block_version; }
            set { WholeDesignData._rope_pulley_block_version = value; }
        }
        //16.钢丝绳最小破断拉力
        private static double _minimum_breaking_load;

        public  double Minimum_breaking_load
        {
            get { return WholeDesignData._minimum_breaking_load; }
            set { WholeDesignData._minimum_breaking_load = value; }
        }
       
        //吊钩组重量
        private static double q1;

        public  double Q11
        {
            get { return WholeDesignData.q1; }
            set { WholeDesignData.q1 = value; }
        }
        //滑轮组倍率
        private static double a;

        public  double A
        {
            get { return WholeDesignData.a; }
            set { WholeDesignData.a = value; }
        }
        //滑轮组效率
        private static double n;

        public  double N
        {
            get { return WholeDesignData.n; }
            set { WholeDesignData.n = value; }
        }
        //钢丝绳计算系数
        private static double c;

        public  double C
        {
            get { return WholeDesignData.c; }
            set { WholeDesignData.c = value; }
        }
        //钢丝绳静工作拉力
        private static double s;

        public  double S
        {
            get { return WholeDesignData.s; }
            set { WholeDesignData.s = value; }
        }
        //钢丝绳最小直径
        private static double d;

        public  double D
        {
            get { return WholeDesignData.d; }
            set { WholeDesignData.d = value; }
        }
        //钢丝绳安全系数
        private static double t;

        public  double T
        {
            get { return WholeDesignData.t; }
            set { WholeDesignData.t = value; }
        }
      
        #endregion

        #region 定滑轮
        private static double crown_block_dc;

        public  double Crown_block_dc
        {
            get { return WholeDesignData.crown_block_dc; }
            set { WholeDesignData.crown_block_dc = value; }
        }
        private static double crown_block_dd;

        public  double Crown_block_dd
        {
            get { return WholeDesignData.crown_block_dd; }
            set { WholeDesignData.crown_block_dd = value; }
        }
        private static double crown_block_dr;

        public  double Crown_block_dr
        {
            get { return WholeDesignData.crown_block_dr; }
            set { WholeDesignData.crown_block_dr = value; }
        }

        #endregion

        #region 卷筒组
        private static double coiling_block_db;

        public  double Coiling_block_db
        {
            get { return WholeDesignData.coiling_block_db; }
            set { WholeDesignData.coiling_block_db = value; }
        }
        private static double coiling_block_height;

        public  double Coiling_block_height
        {
            get { return WholeDesignData.coiling_block_height; }
            set { WholeDesignData.coiling_block_height = value; }
        }
        private static string coiling_block_version;

        public  string Coiling_block_version
        {
            get { return WholeDesignData.coiling_block_version; }
            set { WholeDesignData.coiling_block_version = value; }
        }
        private static double coiling_block_pitch;

        public  double Coiling_block_pitch
        {
            get { return WholeDesignData.coiling_block_pitch; }
            set { WholeDesignData.coiling_block_pitch = value; }
        }
        #endregion

        #region 小车架
        //电机个数
        private static double motor_num = 2;

        public double Motor_num
        {
            get { return WholeDesignData.motor_num; }
            set { WholeDesignData.motor_num = value; }
        }
        //运行速度
        private static double speed_of_motor;

        public double Speed_of_motor
        {
            get { return WholeDesignData.speed_of_motor; }
            set { WholeDesignData.speed_of_motor = value; }
        }
        private static double power_of_motor;
        //小车运行功率
        public double Power_of_motor
        {
            get { return WholeDesignData.power_of_motor; }
            set { WholeDesignData.power_of_motor = value; }
        }
        private static string speed_ratio_of_motor;
        //小车运行减速器速比，未用
        public string Speed_ratio_of_motor
        {
            get { return WholeDesignData.speed_ratio_of_motor; }
            set { WholeDesignData.speed_ratio_of_motor = value; }
        }
        #endregion

        #endregion

        #region 桥架模块

        #endregion

        #region 运行模块

        #endregion

        #region 电控模块

        #endregion
    }
}