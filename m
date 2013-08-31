From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66366] Laptop with Nvidia GPU is hot while using
 xserver-xorg-video-nouveau driver
Date: Sat, 31 Aug 2013 11:15:49 +0000
Message-ID: <bug-66366-8800-595oIZOV5t@http.bugs.freedesktop.org/>
References: <bug-66366-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1695881741=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66366-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1695881741==
Content-Type: multipart/alternative; boundary="1377947749.B23EDBF2.19132"; charset="us-ascii"


--1377947749.B23EDBF2.19132
Date: Sat, 31 Aug 2013 11:15:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66366

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #3)
> Do you really understand that Nvidia-based 1500-3000$ laptop may be really
> killed by overheat with pretty non-binary / no-blob / GPL-friendly
> opensource driver? Are you kidding? :)
> 
The temperatures you've mentioned will not kill your laptop.

> OK, Ilia. Where do yo recommend to post such report about  "power management
> not supported" issues?
> 
There is not much of a benefit in (re-)posting "power management does not
work", most people are aware about this and working on it one way or the other.
If you really want to help, be more understanding and work with the nouveau
team rather than posting annoying replies.

Btw have you realised the _massive_ amount of work that PM is ? The AMD/ATI DPM
code that landed in linux 3.11 is over 50kloc and all of it was done by the
vendor.

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377947749.B23EDBF2.19132
Date: Sat, 31 Aug 2013 11:15:49 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Laptop with Nvidia GPU is hot while using xserver-xorg-video-nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66366#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Laptop with Nvidia GPU is hot while using xserver-xorg-video-nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66366">bug 66366</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66366#c3">comment #3</a>)
<span class="quote">&gt; Do you really understand that Nvidia-based 1500-3000$ laptop may be really
&gt; killed by overheat with pretty non-binary / no-blob / GPL-friendly
&gt; opensource driver? Are you kidding? :)
&gt; </span >
The temperatures you've mentioned will not kill your laptop.

<span class="quote">&gt; OK, Ilia. Where do yo recommend to post such report about  &quot;power management
&gt; not supported&quot; issues?
&gt; </span >
There is not much of a benefit in (re-)posting &quot;power management does not
work&quot;, most people are aware about this and working on it one way or the other.
If you really want to help, be more understanding and work with the nouveau
team rather than posting annoying replies.

Btw have you realised the _massive_ amount of work that PM is ? The AMD/ATI DPM
code that landed in linux 3.11 is over 50kloc and all of it was done by the
vendor.

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377947749.B23EDBF2.19132--

--===============1695881741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1695881741==--
