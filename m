From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80266] Undefined operation in tgsi_ureg.c left shift
 of 1 by 31 places cannot be represented in type 'int'
Date: Fri, 20 Jun 2014 19:12:06 +0000
Message-ID: <bug-80266-8800-LE4DnCqGB4@http.bugs.freedesktop.org/>
References: <bug-80266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0027822305=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0027822305==
Content-Type: multipart/alternative; boundary="1403291526.EB5bD6D0.10397"; charset="us-ascii"


--1403291526.EB5bD6D0.10397
Date: Fri, 20 Jun 2014 19:12:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80266

--- Comment #8 from Vittorio <zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #5)
> I'm not sure why you're filing these against nouveau... I'm sure there are
> _tons_ of these throughout mesa...
> 
> Does gcc warn about this? Are you _sure_ that (signed int)1 << 31 is illegal
> in C99?
Only now I am reading this note.
I compiled mesa with gcc -fsanitize=undefined option, gcc runtime is issuing
several, not tons, of runtime error messages, it seems to me that 
(signed int) 1 << 31 is undefined if computed as int.
The runtime error messages only appear with the -std=c99 option.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403291526.EB5bD6D0.10397
Date: Fri, 20 Jun 2014 19:12:06 +0000
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
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266">bug 80266</a>
              from <span class="vcard"><a class="email" href="mailto:zeccav&#64;gmail.com" title="Vittorio &lt;zeccav&#64;gmail.com&gt;"> <span class="fn">Vittorio</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80266#c5">comment #5</a>)
<span class="quote">&gt; I'm not sure why you're filing these against nouveau... I'm sure there are
&gt; _tons_ of these throughout mesa...
&gt; 
&gt; Does gcc warn about this? Are you _sure_ that (signed int)1 &lt;&lt; 31 is illegal
&gt; in C99?</span >
Only now I am reading this note.
I compiled mesa with gcc -fsanitize=undefined option, gcc runtime is issuing
several, not tons, of runtime error messages, it seems to me that 
(signed int) 1 &lt;&lt; 31 is undefined if computed as int.
The runtime error messages only appear with the -std=c99 option.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403291526.EB5bD6D0.10397--

--===============0027822305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0027822305==--
