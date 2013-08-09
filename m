From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Fri, 09 Aug 2013 16:32:18 +0000
Message-ID: <bug-64323-8800-ZD4crxWO0i@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1445477760=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1445477760==
Content-Type: multipart/alternative; boundary="1376065938.76AEBad2.30937"; charset="us-ascii"


--1376065938.76AEBad2.30937
Date: Fri, 9 Aug 2013 16:32:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
On 09/08/13 16:03, Christ-Jan Wijtmans wrote:
> how did you get dota2 to even start? it should not work with the nouveau
> drivers.
> 
Downloaded the game and pressed Start. I'm not sure what you're implying
there with "it should not work", but it works like a charm with the
patch mentioned. Only bugs I can noticed are in dota2 (i.e. they are
present with the blob, and ati/amd users :P).

Last tested with commit 6a2baf3a06125405aa648e208af782e53f1312c0~1,
because of [1].

Cheers
Emil

[1] https://bugs.freedesktop.org/show_bug.cgi?id=67887
> 
> Live long and prosper,
> 
> Christ-Jan Wijtmans
> http://facebook.com/cj.wijtmans
> http://twitter.com/cjwijtmans
> 
> 
> On Thu, Aug 8, 2013 at 4:48 PM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
> 
>>   *Comment # 5 <https://bugs.freedesktop.org/show_bug.cgi?id=64323#c5> on bug
>> 64323 <https://bugs.freedesktop.org/show_bug.cgi?id=64323> from Emil
>> Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> *
>>
>> Dota 2 exhibits the same issue (patches still seem to work)
>>
>>  ------------------------------
>> You are receiving this mail because:
>>
>>    - You are the assignee for the bug.
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>>
> 
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376065938.76AEBad2.30937
Date: Fri, 9 Aug 2013 16:32:18 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>On 09/08/13 16:03, Christ-Jan Wijtmans wrote:
<span class="quote">&gt; how did you get dota2 to even start? it should not work with the nouveau
&gt; drivers.
&gt; </span >
Downloaded the game and pressed Start. I'm not sure what you're implying
there with &quot;it should not work&quot;, but it works like a charm with the
patch mentioned. Only bugs I can noticed are in dota2 (i.e. they are
present with the blob, and ati/amd users :P).

Last tested with commit 6a2baf3a06125405aa648e208af782e53f1312c0~1,
because of [1].

Cheers
Emil

[1] <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - bisected dota 2 regression"
   href="show_bug.cgi?id=67887">https://bugs.freedesktop.org/show_bug.cgi?id=67887</a>
<span class="quote">&gt; 
&gt; Live long and prosper,
&gt; 
&gt; Christ-Jan Wijtmans
&gt; <a href="http://facebook.com/cj.wijtmans">http://facebook.com/cj.wijtmans</a>
&gt; <a href="http://twitter.com/cjwijtmans">http://twitter.com/cjwijtmans</a>
&gt; 
&gt; 
&gt; On Thu, Aug 8, 2013 at 4:48 PM, &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:
&gt; 
&gt;&gt;   *<a href="show_bug.cgi?id=64323#c5">Comment # 5</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="show_bug.cgi?id=64323#c5">https://bugs.freedesktop.org/show_bug.cgi?id=64323#c5</a>&gt; on bug
&gt;&gt; 64323 &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="show_bug.cgi?id=64323">https://bugs.freedesktop.org/show_bug.cgi?id=64323</a>&gt; from Emil
&gt;&gt; Velikov &lt;<a href="mailto:emil.l.velikov&#64;gmail.com">emil.l.velikov&#64;gmail.com</a>&gt; *
&gt;&gt;
&gt;&gt; Dota 2 exhibits the same issue (patches still seem to work)
&gt;&gt;
&gt;&gt;  ------------------------------
&gt;&gt; You are receiving this mail because:
&gt;&gt;
&gt;&gt;    - You are the assignee for the bug.
&gt;&gt;
&gt;&gt;
&gt;&gt; _______________________________________________
&gt;&gt; Nouveau mailing list
&gt;&gt; <a href="mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists.freedesktop.org</a>
&gt;&gt; <a href="http://lists.freedesktop.org/mailman/listinfo/nouveau">http://lists.freedesktop.org/mailman/listinfo/nouveau</a>
&gt;&gt;
&gt;&gt;
&gt; 
&gt; 
&gt; 
&gt; _______________________________________________
&gt; Nouveau mailing list
&gt; <a href="mailto:Nouveau&#64;lists.freedesktop.org">Nouveau&#64;lists.freedesktop.org</a>
&gt; <a href="http://lists.freedesktop.org/mailman/listinfo/nouveau">http://lists.freedesktop.org/mailman/listinfo/nouveau</a></span >
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376065938.76AEBad2.30937--

--===============1445477760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1445477760==--
