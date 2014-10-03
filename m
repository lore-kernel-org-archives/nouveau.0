From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Fri, 03 Oct 2014 20:31:09 +0000
Message-ID: <bug-27501-8800-FCShi8j8o1@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0732139089=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0732139089==
Content-Type: multipart/alternative; boundary="1412368269.3e106.1453"; charset="UTF-8"


--1412368269.3e106.1453
Date: Fri, 3 Oct 2014 20:31:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #43 from thomas <gurutonic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #42)
> Created attachment 107262 [details] [review]
> Fix acceleration on 9400M v2
> 
> Here is an updated version of the patch.
> 
> Thomas,
> Do you still get screen corruption with it? (I can't reliably reproduce the
> screen corruption unfortunately.)
> GDM seems to work fine on my laptop with only 9400M having acceleration
> enabled. I'll try with 9600M GT acceleration enabled too. :/

Hi Pierre,

I've applied your v2 patch and the results are similar. The 9400M works
correctly. GDM loads fine, but it won't start a gnome-shell session. However,
SLIM works correctly and is able to load both gnome-shell and Awesome. I'm
writing this from gnome-shell now, and performance is good. I haven't had any
screen corruption with the 9400M. I'll use this configuration for now and
report any issues I encounter.

The 9600M GT (acceleration disabled) still has corruption in VT as before, but
this time the screen blanks when X is loaded.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412368269.3e106.1453
Date: Fri, 3 Oct 2014 20:31:09 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:gurutonic&#64;gmail.com" title="thomas &lt;gurutonic&#64;gmail.com&gt;"> <span class="fn">thomas</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c42">comment #42</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=107262" name="attach_107262" title="Fix acceleration on 9400M v2">attachment 107262</a> <a href="attachment.cgi?id=107262&amp;action=edit" title="Fix acceleration on 9400M v2">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=27501&amp;attachment=107262'>[review]</a> [review]
&gt; Fix acceleration on 9400M v2
&gt; 
&gt; Here is an updated version of the patch.
&gt; 
&gt; Thomas,
&gt; Do you still get screen corruption with it? (I can't reliably reproduce the
&gt; screen corruption unfortunately.)
&gt; GDM seems to work fine on my laptop with only 9400M having acceleration
&gt; enabled. I'll try with 9600M GT acceleration enabled too. :/</span >

Hi Pierre,

I've applied your v2 patch and the results are similar. The 9400M works
correctly. GDM loads fine, but it won't start a gnome-shell session. However,
SLIM works correctly and is able to load both gnome-shell and Awesome. I'm
writing this from gnome-shell now, and performance is good. I haven't had any
screen corruption with the 9400M. I'll use this configuration for now and
report any issues I encounter.

The 9600M GT (acceleration disabled) still has corruption in VT as before, but
this time the screen blanks when X is loaded.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412368269.3e106.1453--

--===============0732139089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0732139089==--
