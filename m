From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31139] MBP5,x displays not turned on on resume
Date: Mon, 25 Nov 2013 08:32:24 +0000
Message-ID: <bug-31139-8800-dW8UsixCCn@http.bugs.freedesktop.org/>
References: <bug-31139-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2107514166=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31139-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2107514166==
Content-Type: multipart/alternative; boundary="1385368345.6EB54.11692"; charset="us-ascii"


--1385368345.6EB54.11692
Date: Mon, 25 Nov 2013 08:32:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31139

--- Comment #5 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 89730
  --> https://bugs.freedesktop.org/attachment.cgi?id=89730&action=edit
3.13.0.0-git10.1 kernel log / suspend + resume

Adding 3.13.0.0-git10.1 kernel log, with suspend / resume / suspend /resume as
a sequence.

Kernel options were: nouveau.noaccel=1 nouveau.modeset=0 3
Results: computer is up and running, interactive but screen does not light up

I tried with only nouveau.noaccel=1 but boot hangs up after initialising the
nv96 card; it was working on kernel 3.11.x (though the screen was scrambled),
so I'll fill a bug report for this regression and see if I can bisect it.
Adding nouveau.config=NvMSI=0 changes nothing.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385368345.6EB54.11692
Date: Mon, 25 Nov 2013 08:32:25 +0000
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
   title="NEW --- - MBP5,x displays not turned on on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31139#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MBP5,x displays not turned on on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31139">bug 31139</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=89730" name="attach_89730" title="3.13.0.0-git10.1 kernel log / suspend + resume">attachment 89730</a> <a href="attachment.cgi?id=89730&amp;action=edit" title="3.13.0.0-git10.1 kernel log / suspend + resume">[details]</a></span>
3.13.0.0-git10.1 kernel log / suspend + resume

Adding 3.13.0.0-git10.1 kernel log, with suspend / resume / suspend /resume as
a sequence.

Kernel options were: nouveau.noaccel=1 nouveau.modeset=0 3
Results: computer is up and running, interactive but screen does not light up

I tried with only nouveau.noaccel=1 but boot hangs up after initialising the
nv96 card; it was working on kernel 3.11.x (though the screen was scrambled),
so I'll fill a bug report for this regression and see if I can bisect it.
Adding nouveau.config=NvMSI=0 changes nothing.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385368345.6EB54.11692--

--===============2107514166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2107514166==--
