From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69345] nouveau no longer reports D3cold on
 linux-next as of at least 20130906
Date: Mon, 16 Sep 2013 10:41:08 +0000
Message-ID: <bug-69345-8800-opzx3viGTb@http.bugs.freedesktop.org/>
References: <bug-69345-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1485799238=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69345-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1485799238==
Content-Type: multipart/alternative; boundary="1379328068.dA5B31.24325"; charset="us-ascii"


--1379328068.dA5B31.24325
Date: Mon, 16 Sep 2013 10:41:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69345

Peter Wu <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #2 from Peter Wu <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
That DSM argument mismatch warning is caused by the modules (nouveau and
bbswitch) and is a workaround for buggy DSDTs. It is possible to make the
warning go away, but that will confuse machines with buggy DSDTs.

I haven't looked in the code yet, but what is the issue with D3cold not being
mentioned in dmesg?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379328068.dA5B31.24325
Date: Mon, 16 Sep 2013 10:41:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:lekensteyn&#64;gmail.com" title="Peter Wu &lt;lekensteyn&#64;gmail.com&gt;"> <span class="fn">Peter Wu</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau no longer reports D3cold on linux-next as of at least 20130906"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69345">bug 69345</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>lekensteyn&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau no longer reports D3cold on linux-next as of at least 20130906"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69345#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau no longer reports D3cold on linux-next as of at least 20130906"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69345">bug 69345</a>
              from <span class="vcard"><a class="email" href="mailto:lekensteyn&#64;gmail.com" title="Peter Wu &lt;lekensteyn&#64;gmail.com&gt;"> <span class="fn">Peter Wu</span></a>
</span></b>
        <pre>That DSM argument mismatch warning is caused by the modules (nouveau and
bbswitch) and is a workaround for buggy DSDTs. It is possible to make the
warning go away, but that will confuse machines with buggy DSDTs.

I haven't looked in the code yet, but what is the issue with D3cold not being
mentioned in dmesg?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379328068.dA5B31.24325--

--===============1485799238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1485799238==--
