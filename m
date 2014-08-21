From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77333] [NV108] Unable to use nouveau GK208 as
 offloadsink provider
Date: Thu, 21 Aug 2014 22:28:32 +0000
Message-ID: <bug-77333-8800-FJzH94e8tW@http.bugs.freedesktop.org/>
References: <bug-77333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325322145=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0325322145==
Content-Type: multipart/alternative; boundary="1408660111.B41D752.31036"; charset="us-ascii"


--1408660111.B41D752.31036
Date: Thu, 21 Aug 2014 22:28:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77333

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #8)
> (In reply to comment #6)
> > I just noticed that you mention using xf86-video-nouveau 1.0.9. However
> > GK208 is only supported starting 1.0.10. Please upgrade.
> > 
> > If the issue persists, please attach full logs.
> 
> Sorry, I should've been clearer in comment 4. I forgot to mention that those
> are the logs with xf86-video-nouveau 1.0.10.

Can you confirm that you were also using mesa 10.2.x? (10.2.2 and later should
work largely fine on GK208.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408660111.B41D752.31036
Date: Thu, 21 Aug 2014 22:28:31 +0000
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
   title="NEW --- - [NV108] Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV108] Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77333#c8">comment #8</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=77333#c6">comment #6</a>)
&gt; &gt; I just noticed that you mention using xf86-video-nouveau 1.0.9. However
&gt; &gt; GK208 is only supported starting 1.0.10. Please upgrade.
&gt; &gt; 
&gt; &gt; If the issue persists, please attach full logs.
&gt; 
&gt; Sorry, I should've been clearer in <a href="show_bug.cgi?id=77333#c4">comment 4</a>. I forgot to mention that those
&gt; are the logs with xf86-video-nouveau 1.0.10.</span >

Can you confirm that you were also using mesa 10.2.x? (10.2.2 and later should
work largely fine on GK208.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408660111.B41D752.31036--

--===============0325322145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0325322145==--
