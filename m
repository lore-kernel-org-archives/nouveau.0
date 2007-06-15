From: Jan Buecken <jb.faq-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Two problems
Date: Fri, 15 Jun 2007 13:42:40 +0200
Message-ID: <46727B30.9080501@gmx.de>
References: <4671564A.8010702@gmx.de>
	<20070614190808.7232a6ef@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20070614190808.7232a6ef-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org



Pekka Paalanen schrieb:
> On Thu, 14 Jun 2007 16:52:58 +0200
> Jan Buecken <jb.faq-Mmb7MZpHnFY@public.gmane.org> wrote:
>
>> mkdir: kann Verzeichnis "cards" nicht anlegen: Die Datei existiert
>

Sorry, it was a only copy and paste of the whole error. But this is
solved myself (the reason for this error is that I run the script a
second time without deleting the directory cards or rmtmp. The
translation of this error is:
"mkdir: cannot make directory "cards": The directory already exists"

> Please use English or C locale for reporting error messages.
>
>> bereits detect_devices: Creating probe window failed.
>> Device detection failed.
>
> Are you using 16-bit color depth? If so, please try 24-bit.

Yes. This helps. Thanks. A irritating error message...

>
> Thanks.
>
