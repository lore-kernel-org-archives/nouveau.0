From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80266] Undefined operation in tgsi_ureg.c left shift
 of 1 by 31 places cannot be represented in type 'int'
Date: Fri, 20 Jun 2014 19:16:29 +0000
Message-ID: <bug-80266-8800-YdeIDOZPSz@http.bugs.freedesktop.org/>
References: <bug-80266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1298922679=="
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


--===============1298922679==
Content-Type: multipart/alternative; boundary="1403291789.6e4B6B70.10928"; charset="us-ascii"


--1403291789.6e4B6B70.10928
Date: Fri, 20 Jun 2014 19:16:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80266

--- Comment #9 from Vittorio <zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #6)
> I'm sure that technically shifting any bits into the sign bit of a signed
> number produces undefined behavior according to C99, so yes, (1<<31)
> technically is undefined. As a matter of practicality, on basically any CPU,
> 1<<31 will produce a valid negative number, but the compiler sees it as
> trying to assign the constant 2147483648 to a 32-bit signed container, which
> is outside of the 2^31-1 range that it can accept.
> 
> In the C abstract machine, this would be a serious problem. Obviously you
> can make such an assignment in hardware, but the result (when interpreted as
> signed) is not a value of 2147483648, but a value of -2147483648, which is
> why the compiler gives a warning. It's weird to read that (1<<31) is less
> than 0. If you don't really mean to assign a value of -2147483648 or
> 2147483648 and just want a bit pattern, using unsigned is almost always the
> way to go.
> 
> I know that Solaris Studio happens to give a warning for the same case, if
> that means anything.

Thanks for the appreciated explanation.
Maybe substituting 1<<31 with 1U<<31 clears any undefined behaviour on the many
architectures where mesa runs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403291789.6e4B6B70.10928
Date: Fri, 20 Jun 2014 19:16:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266">bug 80266</a>
              from <span class="vcard"><a class="email" href="mailto:zeccav&#64;gmail.com" title="Vittorio &lt;zeccav&#64;gmail.com&gt;"> <span class="fn">Vittorio</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80266#c6">comment #6</a>)
<span class="quote">&gt; I'm sure that technically shifting any bits into the sign bit of a signed
&gt; number produces undefined behavior according to C99, so yes, (1&lt;&lt;31)
&gt; technically is undefined. As a matter of practicality, on basically any CPU,
&gt; 1&lt;&lt;31 will produce a valid negative number, but the compiler sees it as
&gt; trying to assign the constant 2147483648 to a 32-bit signed container, which
&gt; is outside of the 2^31-1 range that it can accept.
&gt; 
&gt; In the C abstract machine, this would be a serious problem. Obviously you
&gt; can make such an assignment in hardware, but the result (when interpreted as
&gt; signed) is not a value of 2147483648, but a value of -2147483648, which is
&gt; why the compiler gives a warning. It's weird to read that (1&lt;&lt;31) is less
&gt; than 0. If you don't really mean to assign a value of -2147483648 or
&gt; 2147483648 and just want a bit pattern, using unsigned is almost always the
&gt; way to go.
&gt; 
&gt; I know that Solaris Studio happens to give a warning for the same case, if
&gt; that means anything.</span >

Thanks for the appreciated explanation.
Maybe substituting 1&lt;&lt;31 with 1U&lt;&lt;31 clears any undefined behaviour on the many
architectures where mesa runs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403291789.6e4B6B70.10928--

--===============1298922679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1298922679==--
