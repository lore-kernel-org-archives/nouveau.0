From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Sun, 09 Mar 2014 11:22:05 +0000
Message-ID: <bug-33165-8800-9Wx8GeTCBj@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1261933069=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1261933069==
Content-Type: multipart/alternative; boundary="1394364125.365bd07.25711"; charset="us-ascii"


--1394364125.365bd07.25711
Date: Sun, 9 Mar 2014 11:22:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=33165

--- Comment #26 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 95408
  --> https://bugs.freedesktop.org/attachment.cgi?id=95408&action=edit
initialize stuff for gddr5 ram

This patch is based on Andrew's mmiotrace. I saw a sequence of init that I
didn't see in other traces for working cards. Andrew -- would be interesting if
you could check it out and see if it helps. The algorithm I came up with is
insane -- there has to be some sort of data-driven thing going on there, but I
couldn't work it out.

For people having issues, please do a mmiotrace of the blob loading on your
card (see https://wiki.ubuntu.com/X/MMIOTracing for instructions), and send it
(xz -9'd) to mmio.dumps-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394364125.365bd07.25711
Date: Sun, 9 Mar 2014 11:22:05 +0000
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
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165">bug 33165</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=95408" name="attach_95408" title="initialize stuff for gddr5 ram">attachment 95408</a> <a href="attachment.cgi?id=95408&amp;action=edit" title="initialize stuff for gddr5 ram">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=33165&amp;attachment=95408'>[review]</a>
initialize stuff for gddr5 ram

This patch is based on Andrew's mmiotrace. I saw a sequence of init that I
didn't see in other traces for working cards. Andrew -- would be interesting if
you could check it out and see if it helps. The algorithm I came up with is
insane -- there has to be some sort of data-driven thing going on there, but I
couldn't work it out.

For people having issues, please do a mmiotrace of the blob loading on your
card (see <a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a> for instructions), and send it
(xz -9'd) to <a href="mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.com</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394364125.365bd07.25711--

--===============1261933069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1261933069==--
