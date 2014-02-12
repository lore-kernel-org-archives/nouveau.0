From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74695] [NV86] GPU hangs on resume, causing X to crash
Date: Wed, 12 Feb 2014 18:07:44 +0000
Message-ID: <bug-74695-8800-ItSfCsfKu2@http.bugs.freedesktop.org/>
References: <bug-74695-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0609048699=="
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


--===============0609048699==
Content-Type: multipart/alternative; boundary="1392228464.067a11.13455"; charset="us-ascii"


--1392228464.067a11.13455
Date: Wed, 12 Feb 2014 18:07:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74695

--- Comment #11 from Carla sella <carla.sella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I started with compiling kernel v.3.8 19f949f from
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git.
When I boot my PC with kernel 3.8 lightdm doesn't even start and I get a black
screen, I am attaching dmesg from booting on kernel 3.8.
After re-booting on Ubuntu kernel again I get a crash report from Xorg, so I
suppose Xorg crashed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392228464.067a11.13455
Date: Wed, 12 Feb 2014 18:07:44 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU hangs on resume, causing X to crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695">bug 74695</a>
              from <span class="vcard"><a class="email" href="mailto:carla.sella&#64;gmail.com" title="Carla sella &lt;carla.sella&#64;gmail.com&gt;"> <span class="fn">Carla sella</span></a>
</span></b>
        <pre>I started with compiling kernel v.3.8 19f949f from
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git.
When I boot my PC with kernel 3.8 lightdm doesn't even start and I get a black
screen, I am attaching dmesg from booting on kernel 3.8.
After re-booting on Ubuntu kernel again I get a crash report from Xorg, so I
suppose Xorg crashed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392228464.067a11.13455--

--===============0609048699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0609048699==--
