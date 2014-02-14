From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57660] [NVA3:NVC0] Turn on support for
	PIPE_CAP_CUBE_MAP_ARRAY
Date: Fri, 14 Feb 2014 09:17:35 +0000
Message-ID: <bug-57660-8800-styCaYAPEX@http.bugs.freedesktop.org/>
References: <bug-57660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1489538829=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1489538829==
Content-Type: multipart/alternative; boundary="1392369455.fA2A261.7725"; charset="us-ascii"


--1392369455.fA2A261.7725
Date: Fri, 14 Feb 2014 09:17:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57660

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #11)
> Created attachment 93636 [details] [review]
> cubemap array patch
> 
> Well, this fixes the one place I found by copying what nvc0 did. But from
> Martin's test it seems like this probably won't be sufficient, since this
> just takes layer offsets into account.

In case there was any suspense about it, this doesn't work either. It seems
like the texprep instruction doesn't actually adjust for the layer (or we're
passing the layer in wrong) -- cubemap works for layer 0 but not layer 1. Will
need some traces to figure out what's up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392369455.fA2A261.7725
Date: Fri, 14 Feb 2014 09:17:35 +0000
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
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3:NVC0] Turn on support for PIPE_CAP_CUBE_MAP_ARRAY"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660">bug 57660</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57660#c11">comment #11</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=93636" name="attach_93636" title="cubemap array patch">attachment 93636</a> <a href="attachment.cgi?id=93636&amp;action=edit" title="cubemap array patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=57660&amp;attachment=93636'>[review]</a> [review]
&gt; cubemap array patch
&gt; 
&gt; Well, this fixes the one place I found by copying what nvc0 did. But from
&gt; Martin's test it seems like this probably won't be sufficient, since this
&gt; just takes layer offsets into account.</span >

In case there was any suspense about it, this doesn't work either. It seems
like the texprep instruction doesn't actually adjust for the layer (or we're
passing the layer in wrong) -- cubemap works for layer 0 but not layer 1. Will
need some traces to figure out what's up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392369455.fA2A261.7725--

--===============1489538829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1489538829==--
