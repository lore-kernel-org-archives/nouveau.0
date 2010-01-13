From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25966] nv25 : rxvt scrolling is very slow
Date: Wed, 13 Jan 2010 09:37:27 -0800 (PST)
Message-ID: <20100113173728.0BC9E1300B1@annarchy.freedesktop.org>
References: <bug-25966-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25966-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=25966





--- Comment #4 from Matthieu CASTET <castet.matthieu-GANU6spQydw@public.gmane.org>  2010-01-13 09:37:27 PST ---
I did some benchmark with x11perf (without kms) between nvidia driver and
nouveau, and I got [1].

Some rendering is faster (aa, rgb), but other is really slow.

In scrolling test, lot's of cpu is used by kernel.


[1]
1: nvidia-perf2
2: nouveau-perf2

    1              2           Operation
--------   -----------------   -----------------
12800000.0   817000.0 ( 0.064)   Char in 80-char line (6x13) 
12500000.0   810000.0 ( 0.065)   Char in 70-char line (8x13) 
9780000.0   678000.0 ( 0.069)   Char in 60-char line (9x15) 
6730000.0   238000.0 ( 0.035)   Char16 in 40-char line (k14) 
3270000.0   107000.0 ( 0.033)   Char16 in 23-char line (k24) 
8300000.0   964000.0 (  0.12)   Char in 80-char line (TR 10) 
4420000.0   320000.0 ( 0.072)   Char in 30-char line (TR 24) 
5800000.0   772000.0 (  0.13)   Char in 20/40/20 line (6x13, TR 10) 
2370000.0   135000.0 ( 0.057)   Char16 in 7/14/7 line (k14, k24) 
12500000.0   350000.0 ( 0.028)   Char in 80-char image line (6x13) 
11700000.0   293000.0 ( 0.025)   Char in 70-char image line (8x13) 
9540000.0   232000.0 ( 0.024)   Char in 60-char image line (9x15) 
5750000.0   120000.0 ( 0.021)   Char16 in 40-char image line (k14) 
2350000.0    46800.0 ( 0.020)   Char16 in 23-char image line (k24) 
8010000.0   422000.0 ( 0.053)   Char in 80-char image line (TR 10) 
2920000.0   100000.0 ( 0.034)   Char in 30-char image line (TR 24) 
 44800.0   572000.0 ( 12.77)   Char in 80-char aa line (Charter 10) 
 12300.0   233000.0 ( 18.94)   Char in 30-char aa line (Charter 24) 
 43300.0   571000.0 ( 13.19)   Char in 80-char aa line (Courier 12) 
2890000.0   588000.0 (  0.20)   Char in 80-char a line (Charter 10) 
1990000.0   377000.0 (  0.19)   Char in 30-char a line (Charter 24) 
2930000.0   581000.0 (  0.20)   Char in 80-char a line (Courier 12) 
 44700.0   574000.0 ( 12.84)   Char in 80-char rgb line (Charter 10) 
 12300.0   233000.0 ( 18.94)   Char in 30-char rgb line (Charter 24) 
 43400.0   572000.0 ( 13.18)   Char in 80-char rgb line (Courier 12) 
 25800.0    58300.0 (  2.26)   Char in 80-char aa core line (Charter 10) 
  4220.0    10700.0 (  2.54)   Char in 30-char aa core line (Charter 24) 
 19700.0    45800.0 (  2.32)   Char in 80-char aa core line (Courier 12) 
588000.0   315000.0 (  0.54)   Char in 80-char a core line (Charter 10) 
205000.0   115000.0 (  0.56)   Char in 30-char a core line (Charter 24) 
574000.0   314000.0 (  0.55)   Char in 80-char a core line (Courier 12) 
 25900.0    59200.0 (  2.29)   Char in 80-char rgb core line (Charter 10) 
  4220.0    10700.0 (  2.54)   Char in 30-char rgb core line (Charter 24) 
 19700.0    46400.0 (  2.36)   Char in 80-char rgb core line (Courier 12) 
483000.0   187000.0 (  0.39)   Scroll 10x10 pixels 
 69600.0    58800.0 (  0.84)   Scroll 100x100 pixels 
  2790.0     2980.0 (  1.07)   Scroll 500x500 pixels


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
