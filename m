From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74492] [NV4E] v3.13-rc8 nv4e + msi = random lockups
Date: Thu, 20 Feb 2014 08:36:43 +0000
Message-ID: <bug-74492-8800-tysIVBrWJ7@http.bugs.freedesktop.org/>
References: <bug-74492-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1647445127=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74492-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1647445127==
Content-Type: multipart/alternative; boundary="1392885403.61a8d1.16504"; charset="us-ascii"


--1392885403.61a8d1.16504
Date: Thu, 20 Feb 2014 08:36:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74492

--- Comment #17 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 94413
  --> https://bugs.freedesktop.org/attachment.cgi?id=94413&action=edit
Partial output from hang with MSI enabled

I managed to capture some output during a hang. It's not much.

The music stops playing when the pfifo warnings show up. Then it starts playing
and stops at the next pfifo warning.

Should I enable more verbose nouveau logs?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392885403.61a8d1.16504
Date: Thu, 20 Feb 2014 08:36:43 +0000
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
   title="NEW --- - [NV4E] v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492">bug 74492</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=94413" name="attach_94413" title="Partial output from hang with MSI enabled">attachment 94413</a> <a href="attachment.cgi?id=94413&amp;action=edit" title="Partial output from hang with MSI enabled">[details]</a></span>
Partial output from hang with MSI enabled

I managed to capture some output during a hang. It's not much.

The music stops playing when the pfifo warnings show up. Then it starts playing
and stops at the next pfifo warning.

Should I enable more verbose nouveau logs?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392885403.61a8d1.16504--

--===============1647445127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1647445127==--
