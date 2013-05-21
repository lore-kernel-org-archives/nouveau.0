From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64746] optimus don't use nouveau card
Date: Tue, 21 May 2013 19:36:51 +0000
Message-ID: <bug-64746-8800-j6tjWAmKEC@http.bugs.freedesktop.org/>
References: <bug-64746-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1819890455=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64746-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1819890455==
Content-Type: multipart/alternative; boundary="1369165011.82E510.30600"; charset="us-ascii"


--1369165011.82E510.30600
Date: Tue, 21 May 2013 19:36:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64746

--- Comment #1 from Marc Collin <marccollin7379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
i tried to use vgaswitch

cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

first i tried
init 3
echo "0000:00:02.0" /sys/kernel/debug/vgaswitcheroo/switch 
init 5

still intel video card used by glxgears -info


init 3
echo "0000:01:00.0" /sys/kernel/debug/vgaswitcheroo/switch 
init 5

still intel video card used by glxgears -info

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369165011.82E510.30600
Date: Tue, 21 May 2013 19:36:51 +0000
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
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746">bug 64746</a>
              from <span class="vcard"><a class="email" href="mailto:marccollin7379&#64;gmail.com" title="Marc Collin &lt;marccollin7379&#64;gmail.com&gt;"> <span class="fn">Marc Collin</span></a>
</span></b>
        <pre>i tried to use vgaswitch

cat /sys/kernel/debug/vgaswitcheroo/switch 
0:IGD:+:Pwr:0000:00:02.0
1:DIS: :Pwr:0000:01:00.0

first i tried
init 3
echo &quot;0000:00:02.0&quot; /sys/kernel/debug/vgaswitcheroo/switch 
init 5

still intel video card used by glxgears -info


init 3
echo &quot;0000:01:00.0&quot; /sys/kernel/debug/vgaswitcheroo/switch 
init 5

still intel video card used by glxgears -info</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369165011.82E510.30600--

--===============1819890455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1819890455==--
