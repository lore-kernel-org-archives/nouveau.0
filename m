From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] nVidia 9600M GT (Macbook Pro current model)
 is unable to boot
Date: Wed, 17 Jul 2013 22:23:49 +0000
Message-ID: <bug-27501-8800-WCtyePw8QV@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0863104565=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0863104565==
Content-Type: multipart/alternative; boundary="1374099829.DFcCE746.12863"; charset="us-ascii"


--1374099829.DFcCE746.12863
Date: Wed, 17 Jul 2013 22:23:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #25 from Jamie Macdonald <jamie.alban-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
On my Macbook Pro 5,2 (early 2009) with 9400M and 9600M GT, I also have this
bug. nouveau freezes the computer after kernel module load with no extra
parameters.

Using nouveau.noaaccel=1, It boots with scrambled console to graphical openbox
session with artifacts at the top of the screen, but openbox is not functional
(I can only waive my cursor around).

Here: http://pastebin.com/4yhXK0Rt is output of dmesg after booting to
commandline with nouveau.noaccel=1

Here: http://ge.tt/8Cn0b0m/v/0 is an mmiotrace & dmesg & lspci from starting
openbox session with the nvidia blob.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374099829.DFcCE746.12863
Date: Wed, 17 Jul 2013 22:23:49 +0000
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
   title="NEW --- - nVidia 9600M GT (Macbook Pro current model) is unable to boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nVidia 9600M GT (Macbook Pro current model) is unable to boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:jamie.alban&#64;gmail.com" title="Jamie Macdonald &lt;jamie.alban&#64;gmail.com&gt;"> <span class="fn">Jamie Macdonald</span></a>
</span></b>
        <pre>On my Macbook Pro 5,2 (early 2009) with 9400M and 9600M GT, I also have this
bug. nouveau freezes the computer after kernel module load with no extra
parameters.

Using nouveau.noaaccel=1, It boots with scrambled console to graphical openbox
session with artifacts at the top of the screen, but openbox is not functional
(I can only waive my cursor around).

Here: <a href="http://pastebin.com/4yhXK0Rt">http://pastebin.com/4yhXK0Rt</a> is output of dmesg after booting to
commandline with nouveau.noaccel=1

Here: <a href="http://ge.tt/8Cn0b0m/v/0">http://ge.tt/8Cn0b0m/v/0</a> is an mmiotrace &amp; dmesg &amp; lspci from starting
openbox session with the nvidia blob.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374099829.DFcCE746.12863--

--===============0863104565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0863104565==--
