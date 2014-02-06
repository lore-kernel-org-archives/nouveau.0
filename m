From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73200] vdpau-GL interop fails due to different
	screen objects
Date: Thu, 06 Feb 2014 11:30:57 +0000
Message-ID: <bug-73200-8800-nQfl2uRv02@http.bugs.freedesktop.org/>
References: <bug-73200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1480227163=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73200-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1480227163==
Content-Type: multipart/alternative; boundary="1391686257.450b5d1.21795"; charset="us-ascii"


--1391686257.450b5d1.21795
Date: Thu, 6 Feb 2014 11:30:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73200

--- Comment #6 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
Created attachment 93520
  --> https://bugs.freedesktop.org/attachment.cgi?id=93520&action=edit
cache dri fd

Based on the radeon version, cache inode major/minor to only create a single
screen.

Does this fix things?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391686257.450b5d1.21795
Date: Thu, 6 Feb 2014 11:30:57 +0000
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
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200">bug 73200</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=93520" name="attach_93520" title="cache dri fd">attachment 93520</a> <a href="attachment.cgi?id=93520&amp;action=edit" title="cache dri fd">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73200&amp;attachment=93520'>[review]</a>
cache dri fd

Based on the radeon version, cache inode major/minor to only create a single
screen.

Does this fix things?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391686257.450b5d1.21795--

--===============1480227163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1480227163==--
