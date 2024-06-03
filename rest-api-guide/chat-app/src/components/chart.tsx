import * as React from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

export default function ChartsOverviewDemo() {
  const data = [
    { name: 'Q1', series1: 35, series2: 51, series3: 15, series4: 60 },
    { name: 'Q2', series1: 44, series2: 6, series3: 25, series4: 50 },
    { name: 'Q3', series1: 24, series2: 49, series3: 30, series4: 15 },
    { name: 'Q4', series1: 34, series2: 30, series3: 50, series4: 25 },
  ];

  return (
    <ResponsiveContainer width="100%" height={290}>
      <BarChart data={data}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="name" />
        <YAxis />
        <Tooltip />
        <Legend />
        <Bar dataKey="series1" fill="#8884d8" />
        <Bar dataKey="series2" fill="#82ca9d" />
        <Bar dataKey="series3" fill="#ffc658" />
        <Bar dataKey="series4" fill="#ff7300" />
      </BarChart>
    </ResponsiveContainer>
  );
}
