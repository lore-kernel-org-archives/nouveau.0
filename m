From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Thu, 01 Aug 2013 18:05:14 +0000
Message-ID: <bug-67382-8800-3iv2bxWbQa@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0611992409=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0611992409==
Content-Type: multipart/alternative; boundary="1375380314.C85F7ec1.12402"; charset="us-ascii"


--1375380314.C85F7ec1.12402
Date: Thu, 1 Aug 2013 18:05:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #22 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
Created attachment 83466
  --> https://bugs.freedesktop.org/attachment.cgi?id=83466&action=edit
dmesg from 3.9.7 without offendind patch+debug3. Monitor connected to the
second dvi

>> It was working. Xorg.log wrote, that DVI-I-1 is disconnected and DVI-I-2
>> connected.
>Let me see if I'm not day dreaming in here. If you startup with your monitor
>connected to the second DVI port, everything works fine ?

Yes. Setup like Comment15 and changed the dvi-port. After pressing Power and
booting to the end I got my DM and everything else ;)

Did you hope it would check both connectors now and even without the
"offending" patch it would detect a ghost monitor?


On a side note. First 3.7 Kernel is finished, second is being compiled. So the
dmesg from those will follow in about an hour

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375380314.C85F7ec1.12402
Date: Thu, 1 Aug 2013 18:05:14 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:anonymous&#64;dodgeit.com" title="Anonymous Helper &lt;anonymous&#64;dodgeit.com&gt;"> <span class="fn">Anonymous Helper</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83466" name="attach_83466" title="dmesg from 3.9.7 without offendind patch+debug3. Monitor connected to the second dvi">attachment 83466</a> <a href="attachment.cgi?id=83466&amp;action=edit" title="dmesg from 3.9.7 without offendind patch+debug3. Monitor connected to the second dvi">[details]</a></span>
dmesg from 3.9.7 without offendind patch+debug3. Monitor connected to the
second dvi

<span class="quote">&gt;&gt; It was working. Xorg.log wrote, that DVI-I-1 is disconnected and DVI-I-2
&gt;&gt; connected.
&gt;Let me see if I'm not day dreaming in here. If you startup with your monitor
&gt;connected to the second DVI port, everything works fine ?</span >

Yes. Setup like <a href="show_bug.cgi?id=67382#c15">Comment15</a> and changed the dvi-port. After pressing Power and
booting to the end I got my DM and everything else ;)

Did you hope it would check both connectors now and even without the
&quot;offending&quot; patch it would detect a ghost monitor?


On a side note. First 3.7 Kernel is finished, second is being compiled. So the
dmesg from those will follow in about an hour</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375380314.C85F7ec1.12402--

--===============0611992409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0611992409==--
