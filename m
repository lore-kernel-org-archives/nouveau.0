From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73791] [NV96] [BISECTED] Regression: 9600M GT fails
 to boot with 3.13-rc8
Date: Sun, 19 Jan 2014 14:26:32 +0000
Message-ID: <bug-73791-8800-qxmVj0bXi0@http.bugs.freedesktop.org/>
References: <bug-73791-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0555620939=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73791-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0555620939==
Content-Type: multipart/alternative; boundary="1390141593.c2E7B3F1.17030"; charset="us-ascii"


--1390141593.c2E7B3F1.17030
Date: Sun, 19 Jan 2014 14:26:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73791

--- Comment #4 from Andreas Reis <andreas.reis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 92395
  --> https://bugs.freedesktop.org/attachment.cgi?id=92395&action=edit
dmesg of bugged 3.13-rc8+ kernel

Sorry for the delay; took me a while to remember adding "emergency" to the
kernel line in order to be able to copy the faulty dmesg.

I recompiled the kernel (at said "Merge ... net", ie. with the commit you
mentioned included). Turns out there's still a NULL pointer deference
somewhere.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390141593.c2E7B3F1.17030
Date: Sun, 19 Jan 2014 14:26:33 +0000
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
   title="NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.13-rc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73791#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [BISECTED] Regression: 9600M GT fails to boot with 3.13-rc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73791">bug 73791</a>
              from <span class="vcard"><a class="email" href="mailto:andreas.reis&#64;gmail.com" title="Andreas Reis &lt;andreas.reis&#64;gmail.com&gt;"> <span class="fn">Andreas Reis</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92395" name="attach_92395" title="dmesg of bugged 3.13-rc8+ kernel">attachment 92395</a> <a href="attachment.cgi?id=92395&amp;action=edit" title="dmesg of bugged 3.13-rc8+ kernel">[details]</a></span>
dmesg of bugged 3.13-rc8+ kernel

Sorry for the delay; took me a while to remember adding &quot;emergency&quot; to the
kernel line in order to be able to copy the faulty dmesg.

I recompiled the kernel (at said &quot;Merge ... net&quot;, ie. with the commit you
mentioned included). Turns out there's still a NULL pointer deference
somewhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390141593.c2E7B3F1.17030--

--===============0555620939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0555620939==--
