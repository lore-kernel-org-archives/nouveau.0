From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Fri, 15 Apr 2016 09:48:04 +0000
Message-ID: <bug-82714-8800-0irXWndYWn@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0425719635=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0425719635==
Content-Type: multipart/alternative; boundary="14607136830.3E893b09c.30218";
 charset="UTF-8"


--14607136830.3E893b09c.30218
Date: Fri, 15 Apr 2016 09:48:03 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #22 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
And using the G84 for driving the screen results in the display receiving no
signal from the GPU (over VGA (using a VGA->DVI adapter) or HDMI). In the logs,
the card did found the screen and initialised a fb of the correct resolution;
they are no errors to be found.

Starting X still results in a freeze of the computer.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14607136830.3E893b09c.30218
Date: Fri, 15 Apr 2016 09:48:03 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>And using the G84 for driving the screen results in the display receiving no
signal from the GPU (over VGA (using a VGA-&gt;DVI adapter) or HDMI). In the logs,
the card did found the screen and initialised a fb of the correct resolution;
they are no errors to be found.

Starting X still results in a freeze of the computer.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14607136830.3E893b09c.30218--

--===============0425719635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0425719635==--
