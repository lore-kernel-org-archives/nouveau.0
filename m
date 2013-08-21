From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Wed, 21 Aug 2013 08:41:53 +0000
Message-ID: <bug-60772-8800-5Gy2XsOAxf@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1103063335=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1103063335==
Content-Type: multipart/alternative; boundary="1377074513.F1681.24749"; charset="us-ascii"


--1377074513.F1681.24749
Date: Wed, 21 Aug 2013 08:41:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #11 from Honza <hkmaly-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org> ---
Mirkin: You might've overlooked it, but there IS patch in the message you
posted reference to. I don't see what other patch might be needed.

Also, the behaviour I'm seeking is behaviour previous versions (like
xf86-video-nouveau-0.0.16) had. Versions which already supported KMS.

I fail to see why you think it's necessary to change behaviour of
xf86-video-nouveau to support less workflows just to force the workflow you
prefer. All replies against this patch I saw was on ideological ground, none
presented any real reason why it's better this way.

But ok. If I'm only one needing this workflow, I can accept the need to patch
xf86-video-nouveau myself. Still better than reworking whole setup to
workaround your decision.

(Note: Problem with modprobing nouveau manually is that I would need to login
as root or have other setuid binary for that ... hmmm, ok, maybe sudo would
suffice.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377074513.F1681.24749
Date: Wed, 21 Aug 2013 08:41:53 +0000
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
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WONTFIX - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:hkmaly&#64;bigfoot.com" title="Honza &lt;hkmaly&#64;bigfoot.com&gt;"> <span class="fn">Honza</span></a>
</span></b>
        <pre>Mirkin: You might've overlooked it, but there IS patch in the message you
posted reference to. I don't see what other patch might be needed.

Also, the behaviour I'm seeking is behaviour previous versions (like
xf86-video-nouveau-0.0.16) had. Versions which already supported KMS.

I fail to see why you think it's necessary to change behaviour of
xf86-video-nouveau to support less workflows just to force the workflow you
prefer. All replies against this patch I saw was on ideological ground, none
presented any real reason why it's better this way.

But ok. If I'm only one needing this workflow, I can accept the need to patch
xf86-video-nouveau myself. Still better than reworking whole setup to
workaround your decision.

(Note: Problem with modprobing nouveau manually is that I would need to login
as root or have other setuid binary for that ... hmmm, ok, maybe sudo would
suffice.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377074513.F1681.24749--

--===============1103063335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1103063335==--
