From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79611] [NVC0] TRAP ch 4 [0x003fa28000 bzflag]
Date: Wed, 04 Jun 2014 02:40:13 +0000
Message-ID: <bug-79611-8800-VhjvRHIsFx@http.bugs.freedesktop.org/>
References: <bug-79611-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0453609382=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79611-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0453609382==
Content-Type: multipart/alternative; boundary="1401849613.AEE5A1.29677"; charset="us-ascii"


--1401849613.AEE5A1.29677
Date: Wed, 4 Jun 2014 02:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79611

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Did this happen with earlier versions of mesa? If you can reproduce at will, an
apitrace would be nice. (30 mins would be ridiculous though.) I'm not aware of
any opcode emission bugs with nvc0 cards.

Another thing to try would be to make a debug mesa build, and run the game with
NV50_PROG_OPTIMIZE=0 -- that turns off all shader code optimizations, which
would make it even less likely to hit a "weird" instruction emission situation.

This might also be some vram corruption/buffer copy issues/something else
unrelated to opcode emission...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401849613.AEE5A1.29677
Date: Wed, 4 Jun 2014 02:40:13 +0000
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
   title="NEW --- - [NVC0] TRAP ch 4 [0x003fa28000 bzflag]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79611#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] TRAP ch 4 [0x003fa28000 bzflag]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79611">bug 79611</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Did this happen with earlier versions of mesa? If you can reproduce at will, an
apitrace would be nice. (30 mins would be ridiculous though.) I'm not aware of
any opcode emission bugs with nvc0 cards.

Another thing to try would be to make a debug mesa build, and run the game with
NV50_PROG_OPTIMIZE=0 -- that turns off all shader code optimizations, which
would make it even less likely to hit a &quot;weird&quot; instruction emission situation.

This might also be some vram corruption/buffer copy issues/something else
unrelated to opcode emission...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401849613.AEE5A1.29677--

--===============0453609382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0453609382==--
