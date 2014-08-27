From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83079] [NVC0] Dota 2 under Wine freezes with Nouveau
	Drivers
Date: Wed, 27 Aug 2014 20:07:30 +0000
Message-ID: <bug-83079-8800-EsJqMf2xJ1@http.bugs.freedesktop.org/>
References: <bug-83079-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0313365186=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83079-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0313365186==
Content-Type: multipart/alternative; boundary="1409170050.3f44Ad0.8761"; charset="us-ascii"


--1409170050.3f44Ad0.8761
Date: Wed, 27 Aug 2014 20:07:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83079

--- Comment #8 from Luke <lukebenes-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
@Tobias Klausmann
Good point! You are correct, it also crashes with the native port.

This all started from a similar stack overflow error when I was trying to play
CS:GO which does not have a Linux port. I chose to report Dota 2, because it's
free to play, so it would be easier for others to reproduce.

Simpler Steps to reproduce:
1. Install native Steam under Linux
2. Launch Dota 2
3. Start Bot match. Lock in a hero. OR preview an item in the store

Anything else I can do? Would another apitrace or Dota 2 mini dump help?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409170050.3f44Ad0.8761
Date: Wed, 27 Aug 2014 20:07:30 +0000
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
   title="NEW --- - [NVC0] Dota 2 under Wine freezes with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] Dota 2 under Wine freezes with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079">bug 83079</a>
              from <span class="vcard"><a class="email" href="mailto:lukebenes&#64;hotmail.com" title="Luke &lt;lukebenes&#64;hotmail.com&gt;"> <span class="fn">Luke</span></a>
</span></b>
        <pre>&#64;Tobias Klausmann
Good point! You are correct, it also crashes with the native port.

This all started from a similar stack overflow error when I was trying to play
CS:GO which does not have a Linux port. I chose to report Dota 2, because it's
free to play, so it would be easier for others to reproduce.

Simpler Steps to reproduce:
1. Install native Steam under Linux
2. Launch Dota 2
3. Start Bot match. Lock in a hero. OR preview an item in the store

Anything else I can do? Would another apitrace or Dota 2 mini dump help?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409170050.3f44Ad0.8761--

--===============0313365186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0313365186==--
