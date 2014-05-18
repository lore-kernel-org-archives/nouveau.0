From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78863] [NV92] errors when starts gnome-shell -
 INVALID_VALUE class 0x8297 mthd 0x0e04 data 0xfebf0000
Date: Sun, 18 May 2014 16:44:02 +0000
Message-ID: <bug-78863-8800-My4DZQtv7M@http.bugs.freedesktop.org/>
References: <bug-78863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0039704252=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78863-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0039704252==
Content-Type: multipart/alternative; boundary="1400431441.Eea322.9774"; charset="us-ascii"


--1400431441.Eea322.9774
Date: Sun, 18 May 2014 16:44:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78863

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> probably I have that issue/artifact: sometime, portion of a window isn't
> drawed but because simply gray 
> 
> mesa-10.1.3-1

Can you check if this still happens with mesa 10.2-rc3? This should have the
clamping logic I mentioned above. (Except in the 3d blit path, but I'm hoping
that's not the issue.)

> 
> I don't have "lookup" command and I don't find how to get it....teach it to
> me

lookup is from envytools. You shouldn't need to use it, unless you're
interested in nouveau dev. That was just to decode the errors.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400431441.Eea322.9774
Date: Sun, 18 May 2014 16:44:01 +0000
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
   title="NEW --- - [NV92] errors when starts gnome-shell - INVALID_VALUE class 0x8297 mthd 0x0e04 data 0xfebf0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78863#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] errors when starts gnome-shell - INVALID_VALUE class 0x8297 mthd 0x0e04 data 0xfebf0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78863">bug 78863</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78863#c2">comment #2</a>)
<span class="quote">&gt; probably I have that issue/artifact: sometime, portion of a window isn't
&gt; drawed but because simply gray 
&gt; 
&gt; mesa-10.1.3-1</span >

Can you check if this still happens with mesa 10.2-rc3? This should have the
clamping logic I mentioned above. (Except in the 3d blit path, but I'm hoping
that's not the issue.)

<span class="quote">&gt; 
&gt; I don't have &quot;lookup&quot; command and I don't find how to get it....teach it to
&gt; me</span >

lookup is from envytools. You shouldn't need to use it, unless you're
interested in nouveau dev. That was just to decode the errors.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400431441.Eea322.9774--

--===============0039704252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0039704252==--
