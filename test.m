s = serial('COM1');  %���崮�ڶ���
set(s,'BaudRate',9600);  %���ò�����s
fopen(s);  %�򿪴��ڶ���s

interval = 10000;  %���￪ʼ�Ĵ����Part1��Ĵ�������
passo = 1;
t = 1;
x = [];
y = [];
z = [];
flag = 0;
xlabel('Count')
ylabel('Data')
while(t<interval)
    if flag == 0
    a = str2num(fgetl(s))  %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
    x = [x,a]; %������Arduino������Ҫʹ��Serial.println()
    subplot(2,2,1);
    plot(x,'r');
    title('Temperature');
    ylabel('C');
    axis([0 inf 10 50]);
    hold on
    drawnow;
    t = t+passo;
    flag = 1;
    elseif flag == 1
      b = str2num(fgetl(s))  %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
       y = [y,b];
      subplot(2,2,2);
       
       plot(y,'b');
       title('Humidity');
       ylabel('%');
       axis([0 inf 0 100]);
       
       drawnow;
       flag = 2;
       t = t+passo;
    elseif flag == 2
      c = str2num(fgetl(s))  %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
       z = [z,c];
       subplot(2,2,3);

       plot(z,'y');
       title('Dust Ratio');
       ylabel('%');
       axis([0 inf 0 100]);
       t = t+passo;
       drawnow;
    flag = 0;
    end    
end
fclose(s);  %�رմ��ڶ���s