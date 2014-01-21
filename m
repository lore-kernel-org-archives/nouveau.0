From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73770] [NVD9] nouveau doesn't setup 1920x1200 mode
 on HDMI properly
Date: Tue, 21 Jan 2014 22:00:48 +0000
Message-ID: <bug-73770-8800-TbH6qLcXAq@http.bugs.freedesktop.org/>
References: <bug-73770-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1937977625=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73770-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1937977625==
Content-Type: multipart/alternative; boundary="1390341648.ec1B8CD51.18569"; charset="us-ascii"


--1390341648.ec1B8CD51.18569
Date: Tue, 21 Jan 2014 22:00:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73770

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #4)
> I run: xrandr --output DP-1 --set "scaling mode" "None"
> 
> This workarounds the problem, thanks.
> 
> It's still scaled wrongly in VT and I have to run it every time I boot.
> 
> 1) Can I add this workaround in kernel cmd line?

Well, I think xrandr just manipulates the KMS property. You can do this
yourself as well. The only tool I know of that lets you do this is the
"modetest" tool that's in the tests dir of drm, but perhaps there are others.
Perhaps there's also a way to set that as a default via video= or something
like that, but I'm not aware of anything specific.

> 
> 2) Could you fix it properly in nouveau driver to make it scaling right by
> default?

I believe that the current policy was deemed to be the correct one. I don't
really know the details of the various situations though. I believe the
implication of the EDID is that it's really a natively 1920x1080 monitor, so we
should scale for any other resolution. However, again, I'm a little weak on the
specifics. You might try asking in #nouveau or #xorg on freenode.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390341648.ec1B8CD51.18569
Date: Tue, 21 Jan 2014 22:00:48 +0000
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
   title="NEW --- - [NVD9] nouveau doesn't setup 1920x1200 mode on HDMI properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73770#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] nouveau doesn't setup 1920x1200 mode on HDMI properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73770">bug 73770</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73770#c4">comment #4</a>)
<span class="quote">&gt; I run: xrandr --output DP-1 --set &quot;scaling mode&quot; &quot;None&quot;
&gt; 
&gt; This workarounds the problem, thanks.
&gt; 
&gt; It's still scaled wrongly in VT and I have to run it every time I boot.
&gt; 
&gt; 1) Can I add this workaround in kernel cmd line?</span >

Well, I think xrandr just manipulates the KMS property. You can do this
yourself as well. The only tool I know of that lets you do this is the
&quot;modetest&quot; tool that's in the tests dir of drm, but perhaps there are others.
Perhaps there's also a way to set that as a default via video= or something
like that, but I'm not aware of anything specific.

<span class="quote">&gt; 
&gt; 2) Could you fix it properly in nouveau driver to make it scaling right by
&gt; default?</span >

I believe that the current policy was deemed to be the correct one. I don't
really know the details of the various situations though. I believe the
implication of the EDID is that it's really a natively 1920x1080 monitor, so we
should scale for any other resolution. However, again, I'm a little weak on the
specifics. You might try asking in #nouveau or #xorg on freenode.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390341648.ec1B8CD51.18569--

--===============1937977625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1937977625==--
