From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] [NV44] dual-link tmds no longer allowed
Date: Thu, 06 Feb 2014 14:51:49 +0000
Message-ID: <bug-40747-8800-Uqj08oyLP8@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0432514597=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0432514597==
Content-Type: multipart/alternative; boundary="1391698309.F86eAb4.30858"; charset="us-ascii"


--1391698309.F86eAb4.30858
Date: Thu, 6 Feb 2014 14:51:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #22 from Oswald Buddenhagen <ossi-RoXCvvDuEio@public.gmane.org> ---
many reboots later:
- yes, setting the resolution via the kernel command line clearly sets a mode
the kernel considers non-existent in another place
- i'm pretty sure it was using the digital channel of the dvi connector - i
think sysfs said DVI-D, the monitor said it (dunno what it would say if it got
analog on the dvi port), and it didn't do the usual geometry adjustment when
analog input is used
- yes, hacking away the duallink check fixes it
- i have no clue how to compile the kernel / which switch to set to get the
vbios.rom to pop up in the tree

unrelated to the picked resolution, nouveau often locks up the gpu. but that's
for another report ...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391698309.F86eAb4.30858
Date: Thu, 6 Feb 2014 14:51:49 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:ossi&#64;kde.org" title="Oswald Buddenhagen &lt;ossi&#64;kde.org&gt;"> <span class="fn">Oswald Buddenhagen</span></a>
</span></b>
        <pre>many reboots later:
- yes, setting the resolution via the kernel command line clearly sets a mode
the kernel considers non-existent in another place
- i'm pretty sure it was using the digital channel of the dvi connector - i
think sysfs said DVI-D, the monitor said it (dunno what it would say if it got
analog on the dvi port), and it didn't do the usual geometry adjustment when
analog input is used
- yes, hacking away the duallink check fixes it
- i have no clue how to compile the kernel / which switch to set to get the
vbios.rom to pop up in the tree

unrelated to the picked resolution, nouveau often locks up the gpu. but that's
for another report ...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391698309.F86eAb4.30858--

--===============0432514597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0432514597==--
