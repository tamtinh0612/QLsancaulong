using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Microsoft.Reporting.WinForms;

namespace Final_window
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            this.reportViewer1.RefreshReport();
            
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
        DBConnector db;
        private void button1_Click(object sender, EventArgs e)
        {
            String connectionString = "Data Source=DESKTOP-AN9GNNF\\SQLEXPRESS;Initial Catalog=ql_sancaulong;Persist Security Info=True;User ID=sa;Password=Tinh2014";
            SqlConnection con = new SqlConnection(connectionString);
            SqlDataAdapter da = new SqlDataAdapter("select * from View_3 where mahd = '"+textBox1.Text+"'", con);
            DataSet1 ds = new DataSet1();
            da.Fill(ds, "DataTable1");
            ReportDataSource datasource = new ReportDataSource("DataSet1", ds.Tables[0]);
            this.reportViewer1.LocalReport.DataSources.Clear();
            this.reportViewer1.LocalReport.DataSources.Add(datasource);
            this.reportViewer1.RefreshReport();
        }
        SqlConnection con;
        private void button2_Click(object sender, EventArgs e)
        {
        }
    }
}
