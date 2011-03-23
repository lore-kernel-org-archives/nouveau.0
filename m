From: Jerome Glisse <j.glisse-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to directly access GPU memory
Date: Wed, 23 Mar 2011 14:22:02 -0400
Message-ID: <AANLkTimW+f2onDdzzYmqN6UevGfXk1oCjvJ8=DM5f8kt@mail.gmail.com>
References: <87bp1kcef4.fsf@inspiron.ap.columbia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87bp1kcef4.fsf-ki6eFfmvX+JNJvdX2p2jX/iOs8n+Ptt7@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Mar 9, 2011 at 1:54 PM, Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org> wrote:
> Hello,
>
> I would like to directly access some GPU memory. Is there some standard
> way to do this when using the nouveau driver, e.g. by mmap'ing a
> specific range of /dev/something, or do I have to write my own kernel
> module to set up the mapping of the PCIe BARs?
>
> If there is a standard way, is that only standard for the nouveau driver
> or will the same procedure work for other drivers too (in particular the
> proprietary nvidia driver)?
>
>
> Thanks,
>
> =A0 -Nikolaus
>

You can try to mmap the pci bar but neither nouveau or the closed
source driver is intended to play nicely with program that access
video memory directly, you may expect crash and losing data. You need
to play along the rules of each driver by using the proper API to
allocate & access memory which is different btw nouveau and closed
driver or others driver out there.

Cheers,
Jerome
