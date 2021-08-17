using System;
using System.Data;
using System.Data.SqlClient;

namespace Final_window
{
    class DBConnector
    {
        private String connectionString = "Data Source=DESKTOP-AN9GNNF\\SQLEXPRESS;Initial Catalog=ql_sancaulong;Persist Security Info=True;User ID=sa;Password=Tinh2014";

        public DataTable GetData()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "get_all_data";
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getDataTheoTen(string ten)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_find_thongtintheoten";
                    cmd.Parameters.Add("@ten", SqlDbType.NVarChar).Value = ten;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getDataTheoSDT(string sdt)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_find_thongtintheosdt";
                    cmd.Parameters.Add("@sdt", SqlDbType.NVarChar).Value = sdt;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable Find_khachhang(string cmnd)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_find_khachhang";
                    cmd.Parameters.Add("@cmnd", SqlDbType.VarChar).Value = cmnd;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable ThemDatSan(string cmnd, int sosan, DateTime ngaydat, string dattu , string dattoi)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_insert_datsan";
                    cmd.Parameters.Add("@cmnd", SqlDbType.VarChar).Value = cmnd;
                    cmd.Parameters.Add("@sanso", SqlDbType.Int).Value = sosan;
                    cmd.Parameters.Add("@ngaydat", SqlDbType.Date).Value = ngaydat;
                    cmd.Parameters.Add("@dattu", SqlDbType.VarChar).Value = dattu;
                    cmd.Parameters.Add("@datoi", SqlDbType.VarChar).Value = dattoi;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable ThemKhachHang(string hovaten, string cmnd, string sdt)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_insert_khachhang";
                    cmd.Parameters.Add("@cmnd", SqlDbType.VarChar).Value = cmnd;
                    cmd.Parameters.Add("@Hovaten", SqlDbType.NVarChar).Value = hovaten;
                    cmd.Parameters.Add("@sdt", SqlDbType.VarChar).Value = sdt;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable get_all_ThongTin()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_find_thongtin";
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getthongtin(string cmnd)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_getthongtinwithcmnd";
                    cmd.Parameters.Add("@cmnd", SqlDbType.VarChar).Value = cmnd;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataSet getthongtinforreport(string cmnd)
        {
            DataSet dt = new DataSet();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_getthongtinwithcmnd";
                    cmd.Parameters.Add("@cmnd", SqlDbType.VarChar).Value = cmnd;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getthongtinfull(int ngay, int thang, int nam)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_getthongtinbaocaofull";
                    cmd.Parameters.Add("@ngay", SqlDbType.VarChar).Value = ngay;
                    cmd.Parameters.Add("@thang", SqlDbType.VarChar).Value = thang;
                    cmd.Parameters.Add("@nam", SqlDbType.VarChar).Value = nam;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getthongtinwiththangnam(int thang, int nam)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_getthongtinbaocaothang";
                    cmd.Parameters.Add("@thang", SqlDbType.VarChar).Value = thang;
                    cmd.Parameters.Add("@nam", SqlDbType.VarChar).Value = nam;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getthongtinnam(int nam)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_getthongtinbaocaonam";
                    cmd.Parameters.Add("@nam", SqlDbType.VarChar).Value = nam;
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
        public DataTable getHOADONS()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (var cmd = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure
                })
                {
                    cmd.CommandText = "sp_getallHOADON";
                    da = new SqlDataAdapter(cmd);
                    connection.Open();
                    da.Fill(dt);
                    connection.Close();
                }
            }
            return dt;
        }
    }
}
