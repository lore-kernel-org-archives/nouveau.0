From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] Display freeze when starting League of
	Legends (Wine)
Date: Wed, 27 May 2015 05:31:57 +0000
Message-ID: <bug-90567-8800-rn2SifHJgm@http.bugs.freedesktop.org/>
References: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1234180539=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1234180539==
Content-Type: multipart/alternative; boundary="1432704716.5ACaA1.32053"; charset="UTF-8"


--1432704716.5ACaA1.32053
Date: Wed, 27 May 2015 05:31:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

--- Comment #20 from Detlev Casanova <detlev.casanova-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm not sure you can do it with a new account, the game is very restrictive.
The bug occurs with every type of game. To avoid being banned for leaving an
actual game (that's not fair because i would leave a team with 4 against 5), I
create a custom game with bots:

Launch -> login -> play -> select Custom -> Normal -> Create game -> Team size:
1 -> Create game -> Add Bot in team 2 -> Start game -> click yes -> select a
champion -> Lock In -> Wait for freeze.

To generate the trace, I ran playonlinux within apitrace32. I recommand
installing league of legends from playonlinux.

I'll try to generate a new trace tonight.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432704716.5ACaA1.32053
Date: Wed, 27 May 2015 05:31:56 +0000
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
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">bug 90567</a>
              from <span class="vcard"><a class="email" href="mailto:detlev.casanova&#64;gmail.com" title="Detlev Casanova &lt;detlev.casanova&#64;gmail.com&gt;"> <span class="fn">Detlev Casanova</span></a>
</span></b>
        <pre>I'm not sure you can do it with a new account, the game is very restrictive.
The bug occurs with every type of game. To avoid being banned for leaving an
actual game (that's not fair because i would leave a team with 4 against 5), I
create a custom game with bots:

Launch -&gt; login -&gt; play -&gt; select Custom -&gt; Normal -&gt; Create game -&gt; Team size:
1 -&gt; Create game -&gt; Add Bot in team 2 -&gt; Start game -&gt; click yes -&gt; select a
champion -&gt; Lock In -&gt; Wait for freeze.

To generate the trace, I ran playonlinux within apitrace32. I recommand
installing league of legends from playonlinux.

I'll try to generate a new trace tonight.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432704716.5ACaA1.32053--

--===============1234180539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1234180539==--
