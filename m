From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72717] [NVE6] No sound via display port (hdmi works)
Date: Mon, 15 Sep 2014 19:17:51 +0000
Message-ID: <bug-72717-8800-hsLZid7LI4@http.bugs.freedesktop.org/>
References: <bug-72717-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1977114039=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72717-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1977114039==
Content-Type: multipart/alternative; boundary="1410808670.Aa2DaA602.20061"; charset="us-ascii"


--1410808670.Aa2DaA602.20061
Date: Mon, 15 Sep 2014 19:17:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72717

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #4)
> Are there docs that explain what these mean or

Of course (I hope!). But they're internal to NVIDIA and they have no real
interest in sharing. Sometimes things can be found out from occasoinal code
drops, e.g. the more recent gk20a android driver. (Of course that HW has no
display component, so no use for something like this.)

> does this come from replaying register writes from the blob?

Seeing what the blob does + manual poking based on observed patterns.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410808670.Aa2DaA602.20061
Date: Mon, 15 Sep 2014 19:17:50 +0000
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
   title="NEW --- - [NVE6] No sound via display port (hdmi works)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72717#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] No sound via display port (hdmi works)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72717">bug 72717</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=72717#c4">comment #4</a>)
<span class="quote">&gt; Are there docs that explain what these mean or</span >

Of course (I hope!). But they're internal to NVIDIA and they have no real
interest in sharing. Sometimes things can be found out from occasoinal code
drops, e.g. the more recent gk20a android driver. (Of course that HW has no
display component, so no use for something like this.)

<span class="quote">&gt; does this come from replaying register writes from the blob?</span >

Seeing what the blob does + manual poking based on observed patterns.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410808670.Aa2DaA602.20061--

--===============1977114039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1977114039==--
