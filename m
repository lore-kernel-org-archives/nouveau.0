From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25966] nv25 : rxvt scrolling is very slow
Date: Sat, 23 Jan 2010 09:32:12 -0800 (PST)
Message-ID: <20100123173212.BCD0E13010B@annarchy.freedesktop.org>
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





--- Comment #12 from Matthieu CASTET <castet.matthieu-GANU6spQydw@public.gmane.org>  2010-01-23 09:32:11 PST ---
Thanks, here is the diff. There are not many difference. You are only faster
for (aa, rgb) core line.
My cpu is a athlon XP1800+. What is your cpu ?

I will install some debugging symbol to get a better profilling info.


1: nouveau-perf2-kms
2: /tmp/x11perf.txt

    1              2           Operation
--------   -----------------   -----------------
816000.0   759000.0 (  0.93)   Char in 80-char line (6x13) 
809000.0   678000.0 (  0.84)   Char in 70-char line (8x13) 
677000.0   593000.0 (  0.88)   Char in 60-char line (9x15) 
238000.0   167000.0 (  0.70)   Char16 in 40-char line (k14) 
107000.0    64600.0 (  0.60)   Char16 in 23-char line (k24) 
964000.0   890000.0 (  0.92)   Char in 80-char line (TR 10) 
322000.0   246000.0 (  0.76)   Char in 30-char line (TR 24) 
782000.0   771000.0 (  0.99)   Char in 20/40/20 line (6x13, TR 10) 
136000.0    89600.0 (  0.66)   Char16 in 7/14/7 line (k14, k24) 
349000.0   183000.0 (  0.52)   Char in 80-char image line (6x13) 
292000.0   143000.0 (  0.49)   Char in 70-char image line (8x13) 
231000.0   113000.0 (  0.49)   Char in 60-char image line (9x15) 
120000.0    60900.0 (  0.51)   Char16 in 40-char image line (k14) 
 46700.0    21800.0 (  0.47)   Char16 in 23-char image line (k24) 
421000.0   223000.0 (  0.53)   Char in 80-char image line (TR 10) 
100000.0    47100.0 (  0.47)   Char in 30-char image line (TR 24) 
504000.0   780000.0 (  1.55)   Char in 80-char aa line (Charter 10) 
233000.0   448000.0 (  1.92)   Char in 30-char aa line (Charter 24) 
503000.0   781000.0 (  1.55)   Char in 80-char aa line (Courier 12) 
498000.0   785000.0 (  1.58)   Char in 80-char a line (Charter 10) 
301000.0   449000.0 (  1.49)   Char in 30-char a line (Charter 24) 
498000.0   786000.0 (  1.58)   Char in 80-char a line (Courier 12) 
502000.0   786000.0 (  1.57)   Char in 80-char rgb line (Charter 10) 
233000.0   448000.0 (  1.92)   Char in 30-char rgb line (Charter 24) 
505000.0   780000.0 (  1.54)   Char in 80-char rgb line (Courier 12) 
 59700.0   452000.0 (  7.57)   Char in 80-char aa core line (Charter 10) 
 10800.0   165000.0 ( 15.28)   Char in 30-char aa core line (Charter 24) 
 47100.0   381000.0 (  8.09)   Char in 80-char aa core line (Courier 12) 
314000.0   450000.0 (  1.43)   Char in 80-char a core line (Charter 10) 
114000.0   165000.0 (  1.45)   Char in 30-char a core line (Charter 24) 
312000.0   381000.0 (  1.22)   Char in 80-char a core line (Courier 12) 
 59900.0   450000.0 (  7.51)   Char in 80-char rgb core line (Charter 10) 
 10800.0   165000.0 ( 15.28)   Char in 30-char rgb core line (Charter 24) 
 47000.0   382000.0 (  8.13)   Char in 80-char rgb core line (Courier 12) 
222000.0   427000.0 (  1.92)   Scroll 10x10 pixels 
 59100.0    63600.0 (  1.08)   Scroll 100x100 pixels 
  2980.0     3060.0 (  1.03)   Scroll 500x500 pixels


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
