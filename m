From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Sat, 18 Jan 2014 07:07:17 +0000
Message-ID: <bug-73358-8800-JgCtT9rsMn@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2001123718=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2001123718==
Content-Type: multipart/alternative; boundary="1390028837.EABE251.17011"; charset="us-ascii"


--1390028837.EABE251.17011
Date: Sat, 18 Jan 2014 07:07:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #35 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #34)

> > I get no more errors in dmesg and no more hangs.
> 
> Great! I've posted the patch as a series, hopefully it should be in mesa.git
> soonish.
> 

Cool.

> > For now, I disabled
> > hardware acceleration inside the player itself using the lef-click menu.
> 
> Hmmm... that shouldn't be necessary -- no hw acceleration will be provided
> anyways.

Well, it *does* work around the problem (!). It's a temporary substitute for
your patch.

> > Your patch works as intended.
> > 
> > I take it there is no other way for me to contribute??
> 
> This is not the proper forum to discuss that. Come join us in #nouveau @
> irc.freenode.net and we can see if there's overlap between your
> skillset/time commitment/etc, and things that would be helpful for nouveau.
> Or start a discussion at nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org if you dislike IRC.

Okay.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390028837.EABE251.17011
Date: Sat, 18 Jan 2014 07:07:17 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c34">comment #34</a>)

<span class="quote">&gt; &gt; I get no more errors in dmesg and no more hangs.
&gt; 
&gt; Great! I've posted the patch as a series, hopefully it should be in mesa.git
&gt; soonish.
&gt; </span >

Cool.

<span class="quote">&gt; &gt; For now, I disabled
&gt; &gt; hardware acceleration inside the player itself using the lef-click menu.
&gt; 
&gt; Hmmm... that shouldn't be necessary -- no hw acceleration will be provided
&gt; anyways.</span >

Well, it *does* work around the problem (!). It's a temporary substitute for
your patch.

<span class="quote">&gt; &gt; Your patch works as intended.
&gt; &gt; 
&gt; &gt; I take it there is no other way for me to contribute??
&gt; 
&gt; This is not the proper forum to discuss that. Come join us in #nouveau &#64;
&gt; irc.freenode.net and we can see if there's overlap between your
&gt; skillset/time commitment/etc, and things that would be helpful for nouveau.
&gt; Or start a discussion at <a href="mailto:nouveau&#64;lists.freedesktop.org">nouveau&#64;lists.freedesktop.org</a> if you dislike IRC.</span >

Okay.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390028837.EABE251.17011--

--===============2001123718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2001123718==--
