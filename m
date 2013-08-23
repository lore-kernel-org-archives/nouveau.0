From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68456] [NV4B] null deref on load,
	NvI2C=1 makes it work
Date: Fri, 23 Aug 2013 01:46:45 +0000
Message-ID: <bug-68456-8800-LVrVslbg8U@http.bugs.freedesktop.org/>
References: <bug-68456-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0487291110=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68456-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0487291110==
Content-Type: multipart/alternative; boundary="1377222405.cfc2bDb2.28847"; charset="us-ascii"


--1377222405.cfc2bDb2.28847
Date: Fri, 23 Aug 2013 01:46:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68456

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 84484
  --> https://bugs.freedesktop.org/attachment.cgi?id=84484&action=edit
pass i2c functions into create func

Can you give this patch a shot? It compiles, but I haven't tested it beyond
that. Should fix the null deref. But it might still not work. (Obviously
without the NvI2C=1 thing.) BTW, how are you hitting this? Did you set
something in i2c like bit_test=1?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377222405.cfc2bDb2.28847
Date: Fri, 23 Aug 2013 01:46:45 +0000
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
   title="NEW --- - [NV4B] null deref on load, NvI2C=1 makes it work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] null deref on load, NvI2C=1 makes it work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456">bug 68456</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84484" name="attach_84484" title="pass i2c functions into create func">attachment 84484</a> <a href="attachment.cgi?id=84484&amp;action=edit" title="pass i2c functions into create func">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=68456&amp;attachment=84484'>[review]</a>
pass i2c functions into create func

Can you give this patch a shot? It compiles, but I haven't tested it beyond
that. Should fix the null deref. But it might still not work. (Obviously
without the NvI2C=1 thing.) BTW, how are you hitting this? Did you set
something in i2c like bit_test=1?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377222405.cfc2bDb2.28847--

--===============0487291110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0487291110==--
