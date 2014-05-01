From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Thu, 01 May 2014 21:12:26 +0000
Message-ID: <bug-54700-8800-pjLXef5KMy@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1666882122=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1666882122==
Content-Type: multipart/alternative; boundary="1398978746.006d4.4187"; charset="us-ascii"


--1398978746.006d4.4187
Date: Thu, 1 May 2014 21:12:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #62 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #61)
> At the end I got what I wanted. The winner is:
> nvapoke 00100080 e1000000
> 
> This register is e0000000 after suspend or after clean boot. So all this
> trouble only because of a single bit was not set ;(

Fantastic! I was secretly hoping that by ignoring the issue for a short while,
one of the hardware owners would step up and work it out :)

Looks like register 100080 isn't documented in rnndb. In the linux source it's
referred to as NV04_PFB_DEBUG_0. Unfortunately on a quick grep of the code,
nothing ever touches bit 24 of that register.

There are three ways forward:

1. Set it for all nv04:nv50 cards
2. Set it for nv28 cards
3. Reach out to nvidia and see if they'll be kind enough to let us know the
meaning of that bit, and when we should be setting it. They've been fielding
some questions of late, and this seems likely to be one that they'd answer.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398978746.006d4.4187
Date: Thu, 1 May 2014 21:12:26 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c62">Comment # 62</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c61">comment #61</a>)
<span class="quote">&gt; At the end I got what I wanted. The winner is:
&gt; nvapoke 00100080 e1000000
&gt; 
&gt; This register is e0000000 after suspend or after clean boot. So all this
&gt; trouble only because of a single bit was not set ;(</span >

Fantastic! I was secretly hoping that by ignoring the issue for a short while,
one of the hardware owners would step up and work it out :)

Looks like register 100080 isn't documented in rnndb. In the linux source it's
referred to as NV04_PFB_DEBUG_0. Unfortunately on a quick grep of the code,
nothing ever touches bit 24 of that register.

There are three ways forward:

1. Set it for all nv04:nv50 cards
2. Set it for nv28 cards
3. Reach out to nvidia and see if they'll be kind enough to let us know the
meaning of that bit, and when we should be setting it. They've been fielding
some questions of late, and this seems likely to be one that they'd answer.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398978746.006d4.4187--

--===============1666882122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1666882122==--
