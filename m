From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Tue, 15 Jul 2014 19:55:02 +0000
Message-ID: <bug-67878-8800-SCVcVbdVI1@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0502535686=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0502535686==
Content-Type: multipart/alternative; boundary="1405454101.db62Eb8D3.7938"; charset="us-ascii"


--1405454101.db62Eb8D3.7938
Date: Tue, 15 Jul 2014 19:55:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #50 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> 
> I saw Ben Gamari's bisection log (from 3.7->3.8), but I didn't realize that
> you had duplicated the bisection; I only saw your bump 4 months later, on
> 3.13.
> 
> The OP reported this for a Dell Latitude E6400 with G98; are you running
> similar hardware?

HW is not identical. I have a Dell XPS 1330 with 8400M GS (10de:0427)

I originially reported "my" problem in bug 62835. After bisection I found this
issue with the same offending commit and identical symptom.

Donation offer still valid. I have two of these machines laying around
collecting dust.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405454101.db62Eb8D3.7938
Date: Tue, 15 Jul 2014 19:55:01 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c50">Comment # 50</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre><span class="quote">&gt; 
&gt; I saw Ben Gamari's bisection log (from 3.7-&gt;3.8), but I didn't realize that
&gt; you had duplicated the bisection; I only saw your bump 4 months later, on
&gt; 3.13.
&gt; 
&gt; The OP reported this for a Dell Latitude E6400 with G98; are you running
&gt; similar hardware?</span >

HW is not identical. I have a Dell XPS 1330 with 8400M GS (10de:0427)

I originially reported &quot;my&quot; problem in <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen freezes after resume from s2ram"
   href="show_bug.cgi?id=62835">bug 62835</a>. After bisection I found this
issue with the same offending commit and identical symptom.

Donation offer still valid. I have two of these machines laying around
collecting dust.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405454101.db62Eb8D3.7938--

--===============0502535686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0502535686==--
