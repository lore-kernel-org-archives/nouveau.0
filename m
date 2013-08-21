From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Wed, 21 Aug 2013 05:58:55 +0000
Message-ID: <bug-60680-8800-HQahDydYOG@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1079939849=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1079939849==
Content-Type: multipart/alternative; boundary="1377064735.80aD1.17793"; charset="us-ascii"


--1377064735.80aD1.17793
Date: Wed, 21 Aug 2013 05:58:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #8 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> Can you confirm that this is still an issue with 3.11-rc6? If so, a bisect
> between 3.5 and 3.8 would be great. Probably some infoframe validation
> thing, the TV doesn't like it. (My personal bet would be the "move hdmi to
> new system" commit...) Note that the bisect would only have to go over
> drivers/gpu/drm/nouveau, not the whole kernel, so it shouldn't take *too*
> many tries.

Sure, I'll see what I have time to do. Damn, it's been 6 months since I
reported it, I could have figured I had time to bisect, but meh :-D

I was slightly discouraged because the bisection would cross the great rewrite,
but maybe that was unwarranted.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377064735.80aD1.17793
Date: Wed, 21 Aug 2013 05:58:55 +0000
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
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=60680#c7">comment #7</a>)
<span class="quote">&gt; Can you confirm that this is still an issue with 3.11-rc6? If so, a bisect
&gt; between 3.5 and 3.8 would be great. Probably some infoframe validation
&gt; thing, the TV doesn't like it. (My personal bet would be the &quot;move hdmi to
&gt; new system&quot; commit...) Note that the bisect would only have to go over
&gt; drivers/gpu/drm/nouveau, not the whole kernel, so it shouldn't take *too*
&gt; many tries.</span >

Sure, I'll see what I have time to do. Damn, it's been 6 months since I
reported it, I could have figured I had time to bisect, but meh :-D

I was slightly discouraged because the bisection would cross the great rewrite,
but maybe that was unwarranted.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377064735.80aD1.17793--

--===============1079939849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1079939849==--
