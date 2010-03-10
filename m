From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] GT230M/nouveau: X server hangs spontaneously
Date: Wed, 10 Mar 2010 04:33:26 -0800 (PST)
Message-ID: <20100310123327.018B41300DF@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26980





--- Comment #3 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-03-10 04:33:25 PST ---
This seems related to two existing fedora bugs :
https://bugzilla.redhat.com/show_bug.cgi?id=567412
https://bugzilla.redhat.com/show_bug.cgi?id=566987

When using fedora nouveau code, it's usually advised to use fedora bug report.
People following this bug tracker might expect you to run latest git of all
nouveau components :
http://nouveau.freedesktop.org/wiki/InstallNouveau
(two main reasons for that : 1) git is usually better and has more fixes 2) we
do not know what code exactly nouveau is shipping)

As said in https://bugzilla.redhat.com/show_bug.cgi?id=567412#c6 , using the
latest git of xf86-video-nouveau would at least fix the DATA ERROR you see in
kernel log and rules that out.

However, according to mwk, the data error is unlikely to be related to the
hangs. Also he believes he might have the same problem using recent nouveau
code. To confirm that, he would like to know the value of the 400700 register
next time the machine hangs :
$ wget http://0x04.net/~mwk/pgtest/{peek.c,libio.{c,h}}
$ gcc peek.c libio.c  -lpciaccess -o peek
# ./peek 0x400700


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
