From: "Aaron Whitehouse" <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org>
Subject: Compiling REnouveau with Koala's script fails on Ubuntu
	Hardy
Date: Sat, 12 Apr 2008 16:33:30 +1200
Message-ID: <196947f20804112133y68208107j7f5fd7a302cbb580@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Hello,

At the risk of looking like an idiot, I thought I would post because I
can't make Koala's script work. My brother has an nVidia GEforce 8800,
which nobody has dumped for, so I thought I would try.

As I posted here:
https://answers.launchpad.net/ubuntu/+question/29595

I am trying to submit a REnouveau dump from my brother's computer. I
have installed the latest Ubuntu Hardy and have followed the
directions on:
http://nouveau.freedesktop.org/wiki/REnouveau

When I run the script, it runs fine and downloads the current CVS
version. It then says:
"Compiling renouveau failed. Choosing 'YES' will show you the log file
of the compilation. 'NO' will abort. Please have a look at the trouble
shoot section in our FAQ"

The log shows:
-MM -g -Wall `sdl-config --cflags` re.c detection.c t
cc -g -Wall `sdl-config --cflags` -c -o re.o re.c
re.c: In function 'dump_shader_program':
re.c:408: warning: format '%08x' expects type 'unsigned
re.c: In function 'dump_fifo':
re.c:926: warning: unused variable 'str'

Or
cc -g -Wall `sdl-config --cflags` re.o detection.o tests
/usr/bin/ld: cannot find -lXvMCNVIDIA
collect2: ld returned 1 exit status
make: *** [renouveau] Error 1

I am not subscribed to the list, but any help would be appreciated so
that I can get you the dump :).

Thanks,

Aaron

-- 
FSF Associate Member: 5632
http://www.fsf.org
