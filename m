From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Thu, 13 Feb 2014 04:47:10 +0000
Message-ID: <bug-67628-8800-EoZHR4fZ5m@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0585390134=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0585390134==
Content-Type: multipart/alternative; boundary="1392266830.D8aB357c3.13720"; charset="us-ascii"


--1392266830.D8aB357c3.13720
Date: Thu, 13 Feb 2014 04:47:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #19 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hmm... nothing _obvious_ in the code...

Torsten, could you upload your vbios? It seems like your Quadro 600 doesn't
quite line up with Michael's vbios (why would it, not like they're identical
cards... ugh).

Alternatively, Michael, mind giving me a dmesg from before & after with

nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe

(and make sure to mention which machine it's on)

If it's not _too_ difficult, the before & after should be from 0a0afd282f^ and
0a0afd282f, to minimize differences due to other changes that were made.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392266830.D8aB357c3.13720
Date: Thu, 13 Feb 2014 04:47:10 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hmm... nothing _obvious_ in the code...

Torsten, could you upload your vbios? It seems like your Quadro 600 doesn't
quite line up with Michael's vbios (why would it, not like they're identical
cards... ugh).

Alternatively, Michael, mind giving me a dmesg from before &amp; after with

nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe

(and make sure to mention which machine it's on)

If it's not _too_ difficult, the before &amp; after should be from 0a0afd282f^ and
0a0afd282f, to minimize differences due to other changes that were made.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392266830.D8aB357c3.13720--

--===============0585390134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0585390134==--
