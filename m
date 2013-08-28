From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64858] [BISECTED] Nouveau sees invalid EDID for
 eDP-1 whenever that display is turned off
Date: Wed, 28 Aug 2013 17:04:25 +0000
Message-ID: <bug-64858-8800-83AXcOT7kY@http.bugs.freedesktop.org/>
References: <bug-64858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084676530=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1084676530==
Content-Type: multipart/alternative; boundary="1377709465.542c5C2.11929"; charset="us-ascii"


--1377709465.542c5C2.11929
Date: Wed, 28 Aug 2013 17:04:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64858

--- Comment #7 from gspr <gspreemann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I just checked with a known working 3.5 kernel. It does not need poll=0 in
order to be symptom-free. More interestingly though, I accidentally booted into
my current kernel (3.8.x with the patch from comment 5) without poll=0, and it
also works fine. I am sorry if I overlooked this earlier. It could also be that
my distribution has patched the kernel since May. I can look through the
changelogs and/or try an upstream kernel when I have some free time (maybe this
weekend).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377709465.542c5C2.11929
Date: Wed, 28 Aug 2013 17:04:25 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [BISECTED] Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858">bug 64858</a>
              from <span class="vcard"><a class="email" href="mailto:gspreemann&#64;gmail.com" title="gspr &lt;gspreemann&#64;gmail.com&gt;"> <span class="fn">gspr</span></a>
</span></b>
        <pre>I just checked with a known working 3.5 kernel. It does not need poll=0 in
order to be symptom-free. More interestingly though, I accidentally booted into
my current kernel (3.8.x with the patch from <a href="show_bug.cgi?id=64858#c5">comment 5</a>) without poll=0, and it
also works fine. I am sorry if I overlooked this earlier. It could also be that
my distribution has patched the kernel since May. I can look through the
changelogs and/or try an upstream kernel when I have some free time (maybe this
weekend).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377709465.542c5C2.11929--

--===============1084676530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1084676530==--
