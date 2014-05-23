From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] X does not start under kernel 3.13.x
Date: Fri, 23 May 2014 19:44:59 +0000
Message-ID: <bug-78441-8800-altzPrg5m2@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0137844371=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0137844371==
Content-Type: multipart/alternative; boundary="1400874298.7DAFA1.29863"; charset="us-ascii"


--1400874298.7DAFA1.29863
Date: Fri, 23 May 2014 19:44:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> Not sure that it's helpful, but I tried with the latest kernel (provided by
> Fedora 19 - 3.14.4-100.fc19.i686) and it still failed to start the X
> session.  I noticed, on the console while shutting down, that I was seeing
> messages:
> 
> E[Xorg[609]] failed to idle channel 0xcccc0001 [Xorg[609]]
> E[Xorg[609]] failed to idle channel 0xcccc0000 [Xorg[609]] 

This is an indication that the GPU hung.

This is not the sort of thing that'll just fix itself... a bisect would
probably identify the offending commit, which would probably be enough to
figure out what the issue is. I scanned through all the nouveau commits between
3.12 and 3.13, and nothing jumped out as possibly causing this, but a lot of
times there are completely unintended effects.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400874298.7DAFA1.29863
Date: Fri, 23 May 2014 19:44:58 +0000
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
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78441#c7">comment #7</a>)
<span class="quote">&gt; Not sure that it's helpful, but I tried with the latest kernel (provided by
&gt; Fedora 19 - 3.14.4-100.fc19.i686) and it still failed to start the X
&gt; session.  I noticed, on the console while shutting down, that I was seeing
&gt; messages:
&gt; 
&gt; E[Xorg[609]] failed to idle channel 0xcccc0001 [Xorg[609]]
&gt; E[Xorg[609]] failed to idle channel 0xcccc0000 [Xorg[609]] </span >

This is an indication that the GPU hung.

This is not the sort of thing that'll just fix itself... a bisect would
probably identify the offending commit, which would probably be enough to
figure out what the issue is. I scanned through all the nouveau commits between
3.12 and 3.13, and nothing jumped out as possibly causing this, but a lot of
times there are completely unintended effects.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400874298.7DAFA1.29863--

--===============0137844371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0137844371==--
