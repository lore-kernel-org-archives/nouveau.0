From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74695] [NV86] GPU hangs on resume, causing X to crash
Date: Sat, 15 Feb 2014 16:02:06 +0000
Message-ID: <bug-74695-8800-zke0Dke6Sd@http.bugs.freedesktop.org/>
References: <bug-74695-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1783226474=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74695-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1783226474==
Content-Type: multipart/alternative; boundary="1392480126.77FFAb21.31642"; charset="us-ascii"


--1392480126.77FFAb21.31642
Date: Sat, 15 Feb 2014 16:02:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74695

--- Comment #14 from Carla sella <carla.sella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I started bisecting kernel from 3.7 to 3.8 this is the bisect log output:

letozaf@letozaf-PC:~/Documents/linux$ git bisect log
git bisect start
# good: [29594404d7fe73cd80eaa4ee8c43dcc53970c60e] Linux 3.7
git bisect good 29594404d7fe73cd80eaa4ee8c43dcc53970c60e
# bad: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
git bisect bad 19f949f52599ba7c3f67a5897ac6be14bfcb1200
# good: [dadfab4873256d2145640c0ce468fcbfb48977fe] Merge tag 'firewire-updates'
of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
git bisect good dadfab4873256d2145640c0ce468fcbfb48977fe
# bad: [992956189de58cae9f2be40585bc25105cd7c5ad] efi: Fix the build with user
namespaces enabled.
git bisect bad 992956189de58cae9f2be40585bc25105cd7c5ad


I stopped as the second kernel test, the
992956189de58cae9f2be40585bc25105cd7c5ad one, after suspension gave me a black
screen and I could not resume, had to switch of my PC by pushing power button.
After reboot apport reported an Xorg crash.
So I think the problem is on this kernel commit
(992956189de58cae9f2be40585bc25105cd7c5ad).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392480126.77FFAb21.31642
Date: Sat, 15 Feb 2014 16:02:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU hangs on resume, causing X to crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU hangs on resume, causing X to crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695">bug 74695</a>
              from <span class="vcard"><a class="email" href="mailto:carla.sella&#64;gmail.com" title="Carla sella &lt;carla.sella&#64;gmail.com&gt;"> <span class="fn">Carla sella</span></a>
</span></b>
        <pre>I started bisecting kernel from 3.7 to 3.8 this is the bisect log output:

letozaf&#64;letozaf-PC:~/Documents/linux$ git bisect log
git bisect start
# good: [29594404d7fe73cd80eaa4ee8c43dcc53970c60e] Linux 3.7
git bisect good 29594404d7fe73cd80eaa4ee8c43dcc53970c60e
# bad: [19f949f52599ba7c3f67a5897ac6be14bfcb1200] Linux 3.8
git bisect bad 19f949f52599ba7c3f67a5897ac6be14bfcb1200
# good: [dadfab4873256d2145640c0ce468fcbfb48977fe] Merge tag 'firewire-updates'
of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
git bisect good dadfab4873256d2145640c0ce468fcbfb48977fe
# bad: [992956189de58cae9f2be40585bc25105cd7c5ad] efi: Fix the build with user
namespaces enabled.
git bisect bad 992956189de58cae9f2be40585bc25105cd7c5ad


I stopped as the second kernel test, the
992956189de58cae9f2be40585bc25105cd7c5ad one, after suspension gave me a black
screen and I could not resume, had to switch of my PC by pushing power button.
After reboot apport reported an Xorg crash.
So I think the problem is on this kernel commit
(992956189de58cae9f2be40585bc25105cd7c5ad).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392480126.77FFAb21.31642--

--===============1783226474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1783226474==--
