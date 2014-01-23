From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36090] [NV34] [NV49] terminal's visual bell is very
 slow with nouveau
Date: Thu, 23 Jan 2014 18:33:37 +0000
Message-ID: <bug-36090-8800-h55w7upz2Q@http.bugs.freedesktop.org/>
References: <bug-36090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0342266640=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0342266640==
Content-Type: multipart/alternative; boundary="1390502017.CAa343BD4.21500"; charset="us-ascii"


--1390502017.CAa343BD4.21500
Date: Thu, 23 Jan 2014 18:33:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=36090

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looking into EXA a bit, there's a EXASolid impl shared by all pre-nv50 cards.
One of the things it apparently doesn't handle are 32-bit visuals with solid
draws that include a fancy "op", which I assume the visual bell would, like xor
or whatever. I have a hard time believing this restriction holds, so I'm going
to try removing it on some cards I have (at some point).

If you guys want to play around with it, I'm talking about the

        if (ppix->drawable.bitsPerPixel == 32)
            return FALSE;

in NV04EXASetROP. Something causing NV04EXAPrepareSolid to return false would
definitely explain the fallback to fbSolid.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390502017.CAa343BD4.21500
Date: Thu, 23 Jan 2014 18:33:37 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090">bug 36090</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looking into EXA a bit, there's a EXASolid impl shared by all pre-nv50 cards.
One of the things it apparently doesn't handle are 32-bit visuals with solid
draws that include a fancy &quot;op&quot;, which I assume the visual bell would, like xor
or whatever. I have a hard time believing this restriction holds, so I'm going
to try removing it on some cards I have (at some point).

If you guys want to play around with it, I'm talking about the

        if (ppix-&gt;drawable.bitsPerPixel == 32)
            return FALSE;

in NV04EXASetROP. Something causing NV04EXAPrepareSolid to return false would
definitely explain the fallback to fbSolid.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390502017.CAa343BD4.21500--

--===============0342266640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0342266640==--
