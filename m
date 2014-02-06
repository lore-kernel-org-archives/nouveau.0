From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73200] vdpau-GL interop fails due to different
	screen objects
Date: Thu, 06 Feb 2014 20:10:18 +0000
Message-ID: <bug-73200-8800-DfRUhNmJKl@http.bugs.freedesktop.org/>
References: <bug-73200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1249352625=="
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


--===============1249352625==
Content-Type: multipart/alternative; boundary="1391717417.d73Ce0.2099"; charset="us-ascii"


--1391717417.d73Ce0.2099
Date: Thu, 6 Feb 2014 20:10:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73200

--- Comment #8 from Matthew Waters <ystreet00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #6)
> Created attachment 93520 [details] [review]
> cache dri fd
> 
> Based on the radeon version, cache inode major/minor to only create a single
> screen.
> 
> Does this fix things?

No :).

Tracing through, both times that nouveau_drm_screen_create is called, fd_tab is
NULL.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391717417.d73Ce0.2099
Date: Thu, 6 Feb 2014 20:10:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200">bug 73200</a>
              from <span class="vcard"><a class="email" href="mailto:ystreet00&#64;gmail.com" title="Matthew Waters &lt;ystreet00&#64;gmail.com&gt;"> <span class="fn">Matthew Waters</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73200#c6">comment #6</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=93520" name="attach_93520" title="cache dri fd">attachment 93520</a> <a href="attachment.cgi?id=93520&amp;action=edit" title="cache dri fd">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73200&amp;attachment=93520'>[review]</a> [review]
&gt; cache dri fd
&gt; 
&gt; Based on the radeon version, cache inode major/minor to only create a single
&gt; screen.
&gt; 
&gt; Does this fix things?</span >

No :).

Tracing through, both times that nouveau_drm_screen_create is called, fd_tab is
NULL.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391717417.d73Ce0.2099--

--===============1249352625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1249352625==--
